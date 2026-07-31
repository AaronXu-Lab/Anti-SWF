function onFade()
{
   clearInterval(interval_fade);
   if(this._currentframe == 10)
   {
      Demo.enabled = true;
      btn_start.enabled = false;
      btn_help.enabled = false;
      var _loc2_ = this.attachMovie("id_fadeinout","fadeinout",1000);
      _loc2_.frame = "help";
   }
}
var §\x01§ = 379;
var §\x0f§ = 1;
this.scrollRect = new flash.geom.Rectangle(0,0,640,480);
Stage.showMenu = false;
System.useCodepage = true;
Stage.scaleMode = "noScale";
_quality = "MEDIUM";
stop();
testmap = false;
testitem = false;
Demo.enabled = false;
var sound = new JhSound(this);
if(!Demo.enabled)
{
   this.sound.play("snd_titlebg",9999);
}
Demo.enabled = false;
var interval_fade;
var interval_demo;
interval_fade = setInterval(this,"onFade",10000);
