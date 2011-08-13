class PointCase extends haxe.unit.TestCase {

  var p: Point;

  public function new () {
    super();
    p = new Point(12,4);
  }

  public function testX() {
    assertEquals(p.x, 12);
  }

  public function testY() {
    assertEquals(p.y, 4); 
  }

}

class PointTest {
    static function main(){
        var r = new haxe.unit.TestRunner();
        r.add(new PointCase());
        // your can add others TestCase here

        // finally, run the tests
        r.run();
    }
}