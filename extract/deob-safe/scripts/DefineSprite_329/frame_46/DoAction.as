var §\x01§ = 41;
var §\x0f§ = 1;
stop();
var owner = this;
if(!Demo.enabled)
{
   this._parent.mouse_mc._visible = true;
   this._parent.onEnterFrame = function()
   {
      if(Key.isDown(1))
      {
         delete this.onEnterFrame;
         this._parent.sound.play("snd_click");
         owner.play();
      }
   };
}
else
{
   play();
}
