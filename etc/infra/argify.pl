use File::Find;

$ARQ='arq.bat';
$PELLET='pellet.bat';

my @files;

my $dirname = shift or die "Usage: $0 DIRNAME\n";
print "Starting: $dirname\n" ;
my @dirpath=$dirname;

find( sub {
	push @files, $File::Find::name if (-f $File::Find::name and /\.rdf$/);
      }, @dirpath);

$result = join (" --data=", @files);

$result =~ s/\\/\//g;
$result =~ s/c:\/Documents\/Ontologies\/\/FIBO\/fibo-git\///g;
#$result =~ s/\//\\/g;

$command = "$ARQ --data=$result --query=..\\testing\\echo.sq --results=RDF > c:\\temp\\temp.rdf 2>&1 ";

$ENV{JENA_HOME} = "c:\\Documents\\Software\\jena\\apache-jena-2.13.0\\";
$ENV{PELLET_HOME} = "c:\\Documents\\Software\\Pellet\\pellet-master\\";

print "EXECUTING: cmd.exe /C $command ";
my $status = system( "cmd.exe", "/C", $command );


print "cd into the pellet directory";
chdir($ENV{PELLET_HOME});

print "then run pellet on the temp.rdf file";
my $pelletStatus = system( "cmd.exe", "/C", "$PELLET lint --root-only file://c:/temp/temp.rdf");
print $pelletStatus

