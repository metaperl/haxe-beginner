my $a = "

             _e.add( pos );
        pos = new List();
        pos.add(222.75);
        pos.add(64.2);
        _e.add( pos );
        pos = new List();
        pos.add(233.95);
        pos.add(64.65);
        _e.add( pos );
        pos = new List();
        pos.add(243.75);
        pos.add(69.2);
        _e.add( pos );
        pos = new List();
        pos.add(249.95);
        pos.add(78.8);
        _e.add( pos );
        pos = new List();
        pos.add(250.6);
        pos.add(90.45);
        _e.add( pos );
        pos = new List();
        pos.add(250.6);
        pos.add(92.95);
        _e.add( pos );
        pos = new List();
        pos.add(214.55);
        pos.add(93.45);
        _e.add( pos );
        pos = new List();
        pos.add(218.2);
        pos.add(102.1);
        _e.add( pos );
        pos = new List();
        pos.add(228);
        pos.add(106.2);
        _e.add( pos );
        pos = new List();
        pos.add(235.55);
        pos.add(105.1);
        _e.add( pos );
        pos = new List();
        pos.add(241.05);
        pos.add(102.1);
        _e.add( pos );
        pos = new List();
        pos.add(245.6);
        pos.add(110.8);
        _e.add( pos );
        pos = new List();
        pos.add(234.4);
        pos.add(115.35);
        _e.add( pos );
        pos = new List();
        pos.add(222.05);
        pos.add(115.6);
        _e.add( pos );
        pos = new List();
        pos.add(212);
        pos.add(111.7);
        _e.add( pos );
        pos = new List();
        pos.add(204.7);
        pos.add(103);
        _e.add( pos );
        pos = new List();
        pos.add(202.2);
        pos.add(93.45);
        _e.add( pos );
        pos = new List();
        pos.add(203.1);
        pos.add(82.9);
        _e.add( pos );
        pos = new List();
        pos.add(206.55);
        pos.add(75.15);
        _e.add( pos );
        pos = new List();
        pos.add(212);
        pos.add(69);
        _e.add( pos );
        pos = new List();
        pos.add(239.2);
        pos.add(84.3);
        _e.add( pos );
        pos = new List();
        pos.add(236);
        pos.add(76.75);
        _e.add( pos );
        pos = new List();
        pos.add(227.8);
        pos.add(74);
        _e.add( pos );
        pos = new List();
        pos.add(219.3);
        pos.add(76.75);
        _e.add( pos );
        pos = new List();
        pos.add(215);
        pos.add(84.3);
        _e.add( pos );
        pos = new List();
        pos.add(223.2);
        pos.add(84.3);
        _e.add( pos );
        pos = new List();
        pos.add(239.2);
        pos.add(84.3);
        _e.add( pos );

";

my @a = $a =~ /\((\d+(?:[.]\d+)?)\)/g;
warn "@a";

use List::MoreUtils;

my $it = List::MoreUtils::natatime 2, @a;

while (my @val = $it->()) {
  print "_e.add ( new Point ( $val[0] , $val[1] ) );\n";
}
