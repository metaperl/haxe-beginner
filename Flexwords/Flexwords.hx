
// modification of http://haxe.org/byexample/lambda/flash9/map
import flash.display.MovieClip;
import flash.display.Sprite;
import flash.Lib;
import flash.events.MouseEvent;

import Point;
typedef Letter = List<Point>;
typedef Word   = List<Letter>;

class Flexwords
{
  // vector representations of the letters
  private var _h: Letter;
  private var _a: Letter;
  private var _x: Letter;
  private var _e: Letter;
  private var _currentLetter: Letter;
  private var _word: Word;

  private var _stage: MovieClip;
  private var _view_mc: Sprite;
  private var _currMouseX: Float;
  private var _currMouseY: Float;
    
  public function new()
  {
    _stage = Lib.current;
        
    _word = [ _h, _a, _x, _e ];
    // create 'list' structures to hold vector data
    createHaXeData();
        
    createView();
        
    // draw coordinates to screen as defined in this array of letters 
    drawLetters();

    // when mouse moves map vector data based on new mouse position.
    _view_mc.addEventListener( MouseEvent.MOUSE_MOVE, repos );
  }

  private function currMouseX () {
    _view_mc.mouseX;
  }

  private function currMouseY () {
    _view_mc.mouseY;
  }

  private function repos( e: MouseEvent ):Void
  {
    _currMouseX = _view_mc.mouseX;
    _currMouseY = _view_mc.mouseY;
    drawLetters( [
		  Lambda.map( _h, reactToMouse ),
		  Lambda.map( _a, reactToMouse ),
		  Lambda.map( _x, reactToMouse ),
		  Lambda.map( _e, reactToMouse )
		  ]);
                    
  }
    
  // create new positions based on old via a mapping using mouse position
  private function reactToMouse( origPos: Letter ):Letter
  {
    var pos: Letter = new List();
    var _x: Float = origPos.first();
    var _y: Float = origPos.last();
    if(  _currMouseX > _x )
      {
	pos.add( _x - 100*Math.sqrt( Math.abs( _currMouseX - _x )/500 ) );
      }
    else
      {
	pos.add( _x + 100*Math.sqrt( Math.abs( _currMouseX - _x )/500 ) );
      }
    if(  _currMouseY > _y )
      {
	pos.add( _y - 100*Math.sqrt( Math.abs( _currMouseY - _y )/500 ) );
      }
    else
      {
	pos.add( _y + 100*Math.sqrt( Math.abs( _currMouseY - _y )/500 ) );
      }
    return pos;
  }
    
  private function createView():Void
  {
    _view_mc = new Sprite();
    _view_mc.x = 100;
    _view_mc.y = 100;
    _stage.addChild( _view_mc );
        
  }
  private function drawLetters( ):Void
  {
    _view_mc.graphics.clear();
    // draw a background
    _view_mc.graphics.beginFill(0xFFD541,1);
    _view_mc.graphics.moveTo(-70,-10);
    _view_mc.graphics.lineTo(350,-10);
    _view_mc.graphics.lineTo(350,170);
    _view_mc.graphics.lineTo(-70,170);

    // draw each letter
    for( aLetter in _word )
      {
	_currentLetter = aLetter;
	drawALetter;
      }
  }
    
  private function drawALetter( ):Void
  {
    _view_mc.graphics.beginFill(0xFD7D00,100);
    _view_mc.graphics.lineStyle(0,0xFD7D00, 0);  
    var pos:Letter = _currentLetter.first();
    _view_mc.graphics.moveTo( pos.x, pos.y );
        
    for( pos in _currentLetter )
      {
	_view_mc.graphics.lineTo( pos.x, pos.y );
      }
        
  }
    
  public static function main(): Void { 
    new Flexwords(); 
  }
    
  // Raw data ( created from MovieClip instance positions using traces in flash details not shown )
  // The example data is not important and in reality may come from XML rather than hard coded.
  private function createHaXeData():Void
  {
    _h = new Letter;
    _a = new Letter;
    _x = new Letter;
    _e = new Letter;
        
    // temp store of x and y coordinates as a list added to a list of points defining a letter 
    var pos: Letter;

    _h.add( new Point(32.2, 46.35) );
    _h.add( new Point(44.3, 46.6) );
    _h.add( new Point(44.5, 73.35) );
    _h.add( new Point(71.95, 46.6) );
    _h.add( new Point(84.05, 46.6) );
    _h.add( new Point(83.6, 114.9) );
    _h.add( new Point(71.7, 115.15) );
    _h.add( new Point(71, 84.5) );
    _h.add( new Point(44.75, 84.3) );
    _h.add( new Point( 44.3, 115.15) );
    _h.add( new Point( 32.4, 114.9) );
    _h.add( new Point( 98.9, 67.4) );

    _a.add ( new Point ( 107.35 , 64.4 ) );
    _a.add ( new Point ( 119.7 , 64.4 ) );
    _a.add ( new Point ( 127.45 , 66.95 ) );
    _a.add ( new Point ( 132.95 , 73.35 ) );
    _a.add ( new Point ( 134.75 , 81.55 ) );
    _a.add ( new Point ( 135.2 , 103.5 ) );
    _a.add ( new Point ( 136.8 , 109.65 ) );
    _a.add ( new Point ( 138.85 , 111.7 ) );
    _a.add ( new Point ( 134.55 , 115.15 ) );
    _a.add ( new Point ( 129.05 , 115.35 ) );
    _a.add ( new Point ( 126.55 , 113.05 ) );
    _a.add ( new Point ( 124.95 , 109.9 ) );
    _a.add ( new Point ( 120.15 , 113.75 ) );
    _a.add ( new Point ( 113.3 , 115.8 ) );
    _a.add ( new Point ( 105.75 , 115.35 ) );
    _a.add ( new Point ( 98.2 , 111.7 ) );
    _a.add ( new Point ( 93.85 , 104.4 ) );
    _a.add ( new Point ( 94.1 , 95.5 ) );
    _a.add ( new Point ( 98.45 , 87.95 ) );
    _a.add ( new Point ( 105.3 , 83.85 ) );
    _a.add ( new Point ( 112.15 , 81.8 ) );
    _a.add ( new Point ( 118.55 , 81.55 ) );
    _a.add ( new Point ( 123.8 , 82.45 ) );
    _a.add ( new Point ( 121.3 , 76.5 ) );
    _a.add ( new Point ( 112.85 , 73.8 ) );
    _a.add ( new Point ( 104.4 , 75.15 ) );
    _a.add ( new Point ( 102.8 , 76.05 ) );
    _a.add ( new Point ( 99.1 , 67.4 ) );
    _a.add ( new Point ( 123.35 , 91.6 ) );
    _a.add ( new Point ( 114.45 , 90.9 ) );
    _a.add ( new Point ( 106.65 , 94.35 ) );
    _a.add ( new Point ( 106 , 103 ) );
    _a.add ( new Point ( 112.85 , 106 ) );
    _a.add ( new Point ( 118.75 , 105.75 ) );
    _a.add ( new Point ( 122.4 , 102.1 ) );
    _a.add ( new Point ( 123.55 , 96.4 ) );
    _a.add ( new Point ( 123.3 , 91.8 ) );
    _a.add ( new Point ( 143.65 , 46.35 ) );

    _x.add ( new Point ( 156.25 , 46.35 ) );
    _x.add ( new Point ( 170.65 , 69.65 ) );
    _x.add ( new Point ( 185.25 , 46.35 ) );
    _x.add ( new Point ( 197.6 , 46.35 ) );
    _x.add ( new Point ( 177.05 , 79.95 ) );
    _x.add ( new Point ( 198.75 , 114.9 ) );
    _x.add ( new Point ( 185.7 , 115.15 ) );
    _x.add ( new Point ( 170.4 , 90.45 ) );
    _x.add ( new Point ( 154.9 , 115.35 ) );
    _x.add ( new Point ( 142.1 , 114.9 ) );
    _x.add ( new Point ( 164.25 , 79.95 ) );
    _x.add ( new Point ( 143.7 , 46.35 ) );
    _x.add ( new Point ( 212 , 69.2 ) );
  
    _e.add ( new Point ( 222.75 , 64.2 ) );
    _e.add ( new Point ( 233.95 , 64.65 ) );
    _e.add ( new Point ( 243.75 , 69.2 ) );
    _e.add ( new Point ( 249.95 , 78.8 ) );
    _e.add ( new Point ( 250.6 , 90.45 ) );
    _e.add ( new Point ( 250.6 , 92.95 ) );
    _e.add ( new Point ( 214.55 , 93.45 ) );
    _e.add ( new Point ( 218.2 , 102.1 ) );
    _e.add ( new Point ( 228 , 106.2 ) );
    _e.add ( new Point ( 235.55 , 105.1 ) );
    _e.add ( new Point ( 241.05 , 102.1 ) );
    _e.add ( new Point ( 245.6 , 110.8 ) );
    _e.add ( new Point ( 234.4 , 115.35 ) );
    _e.add ( new Point ( 222.05 , 115.6 ) );
    _e.add ( new Point ( 212 , 111.7 ) );
    _e.add ( new Point ( 204.7 , 103 ) );
    _e.add ( new Point ( 202.2 , 93.45 ) );
    _e.add ( new Point ( 203.1 , 82.9 ) );
    _e.add ( new Point ( 206.55 , 75.15 ) );
    _e.add ( new Point ( 212 , 69 ) );
    _e.add ( new Point ( 239.2 , 84.3 ) );
    _e.add ( new Point ( 236 , 76.75 ) );
    _e.add ( new Point ( 227.8 , 74 ) );
    _e.add ( new Point ( 219.3 , 76.75 ) );
    _e.add ( new Point ( 215 , 84.3 ) );
    _e.add ( new Point ( 223.2 , 84.3 ) );
    _e.add ( new Point ( 239.2 , 84.3 ) );
        
  }

}
