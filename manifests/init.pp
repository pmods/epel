class epel {

    $epel_release = "6-8"
    $epel_url = "http://mirror.pnl.gov/epel/6/i386"
    $epel_rpm = "$epel_url/epel-release-$epel_release.noarch.rpm"

    $execpath = "/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin"

    exec { 'epel-install':
        command => "rpm -Uvh $epel_rpm",
        user    => "root",
        cwd     => "/root",
        path    => $execpath,
        unless  => "rpm -qa | grep epel"
    }
}
