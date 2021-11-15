## CLI

Get ruleset infos

    oscap info /usr/share/xml/scap/ssg/content/ssg-rhel7-ds.xml
    oscap info /usr/share/xml/scap/ssg/content/ssg-centos7-ds.xml

Evaluatione examples

    oscap xccdf eval --report report.html --profile xccdf_org.ssgproject.content_profile_pci-dss /usr/share/xml/scap/ssg/content/ssg-rhel7-ds.xml
