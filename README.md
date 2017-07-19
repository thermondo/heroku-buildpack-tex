Heroku buildpack: TeX
=====================

This is a [Heroku buildpack](http://devcenter.heroku.com/articles/buildpacks) for working with TeX documents.

    $ ls

    $ heroku create --buildpack git://github.com/syphar/heroku-buildpack-tex.git

    $ git push heroku master
    ...
    -----> Heroku receiving push
    -----> Fetching custom build pack... done
    -----> TeX app detected
    ...

This can be useful if you simply want to play around with TeX Live without
having to build or install it yourself. You can pull it up on your instance
easily in bash:

    $ heroku run bash

Multipacks
----------

More likely, you'll want to use it as part of a larger project, which needs to
build PDFs. The easiest way to do this is with a [multipack](https://github.com/ddollar/heroku-buildpack-multi),
where this is just one of the buildpacks you'll be working with.

    $ cat .buildpacks
    git://github.com/heroku/heroku-buildpack-python.git
    git://github.com/holiture/heroku-buildpack-tex.git

    $ heroku config:add BUILDPACK_URL=git://github.com/ddollar/heroku-buildpack-multi.git

This will bundle TeX Live into your instance without impacting your existing
system. You can then call out to executables like `pdflatex` as you would on
any other machine.

How does it work?
-----------------
- In this form, it uses [install-tl](http://www.tug.org/texlive/doc/install-tl.html) it installs a working TeX Live into your application into your Heroku app.

- it installs `scheme-small` to have a working minimal setup

- it uses [tlmgr](http://www.tug.org/texlive/tlmgr.html) to install custom packages.

- On subsequent pushes it uses [tlmgr](http://www.tug.org/texlive/tlmgr.html) to update all installed packages.

- to save space, we cleanup the installation a bit (removing documentation for example).

The downside of this method compared to a prepackaged TeX-Live is that the first push will take some minutes. But we get more flexibility and custom packages!

Custom packages
---------------
You can add a file called `texlive.packages` in your repo:

    collection-bibtexextra
    collection-fontsextra
    collection-langgerman
    collection-xetex

It looks similar to the default `texlive.profile`, but without the `1` or `0` at the end. The buildpack runs `tlmgr install` on every line in this file. So you can use single packages or these collections.

When you add custom packages, keep in mind that Heroku has a maximum compressed slug-size of 300 MB (see [here](https://devcenter.heroku.com/articles/slug-compiler#slug-size)). And TeX-Live can get quite big.

Custom TeX Live version
-----------------------
By default the latest TeX Live version will be installed. You can customize the path to the repository to be used by adding a file called `.texlive-repository` to your project.
It should contain only the path to the location of the TeX Live repository that you want to use without trailing `/`. For example:

    ftp://tug.org/historic/systems/texlive/2016/tlnet-final

will install the latest TeX Live 2016 release.
