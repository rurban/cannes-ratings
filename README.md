Dancer on OpenShift
===================


This git repository helps you get up and running quickly w/ a Dancer installation
on OpenShift.  The Dancer project name used in this repo is 'openshift'
but you can feel free to change it.


Running on OpenShift
----------------------------

Create an account at http://openshift.redhat.com/

Create a perl-5.10 application

    rhc app create -a dancer -t perl-5.10

Add this upstream dancer repo

    cd dancer
    git rm -r perl
    git commit -a -m "remove stock perl dir to prepare for Dancer"
    git remote add upstream -m master git://github.com/openshift/dancer-example.git
    git pull -s recursive -X theirs upstream master
    
Then push the repo upstream

    git push

That's it, you can now checkout your application at:

    http://dancer-$yournamespace.rhcloud.com

