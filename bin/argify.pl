use File::Find;

#set PATH=%PATH%;c:\Users\weiyeh\Desktop\apps\pellet-2.3.1;d:\apps\apache-jena-2.10.1\bat\arq.bat;

$ARQ='arq.bat';
$PELLET='c:\Users\weiyeh\Desktop\apps\pellet-2.3.1\pellet.bat';

my @files;

my $dirname = shift or die "Usage: $0 DIRNAME\n";
print "Starting: $dirname\n" ;
my @dirpath=$dirname;

find( sub {
	push @files, $File::Find::name if (-f $File::Find::name and /\.rdf$/);
      }, @dirpath);

$result = join (" --data=", @files);

$result =~ s/\\/\//g;
$result =~ s/c:\/users\/weiyeh\/desktop\/projects\/edmcouncil_fibo\///g;
#$result =~ s/\//\\/g;

$command = "$ARQ --data=$result --query=etc\\testing\\echo.sq --results=RDF > c:\\temp\\temp.rdf 2>&1 ";

$ENV{JENA_HOME} = "d:\\apps\\apache-jena-2.10.1\\";
$ENV{PELLET_HOME} = "c:\\Users\\weiyeh\\Desktop\\apps\\pellet-2.3.1\\";

print "EXECUTING: cmd.exe /C $command ";
my $status = system( "cmd.exe", "/C", $command );


print "cd into the pellet directory";
chdir($ENV{PELLET_HOME});

print "then run pellet on the temp.rdf file";
my $pelletStatus = system( "cmd.exe", "/C", "$PELLET lint --root-only c:/temp/temp.rdf");
print $pelletStatus

