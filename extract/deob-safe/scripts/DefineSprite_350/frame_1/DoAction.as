function demoPlay()
{
   clearInterval(interval);
   if(this._currentframe == 268)
   {
      demoStop();
   }
   else
   {
      play();
   }
}
function demoStop()
{
   clearInterval(interval);
   this._parent.sound.stop("snd_run");
   this._parent.sound.stop("snd_spin");
   var _loc2_ = this._parent.attachMovie("id_fadeinout","fadeinout",1000);
   _loc2_.frame = "title";
}
function intervalDemo(time)
{
   if(Demo.enabled)
   {
      interval = setInterval(this,"demoPlay",time * 1000);
   }
}
var §\x01§ = 511;
var §\x0f§ = 1;
mouse_mc._visible = false;
this._parent.sound.play("snd_run",9999);
if(Demo.enabled)
{
   btn_start._visible = false;
   this.mouse_mc.onEnterFrame = function()
   {
      if(Key.isDown(1))
      {
         delete this.onEnterFrame;
         demoStop();
      }
   };
}
var interval;
var interval_end;
