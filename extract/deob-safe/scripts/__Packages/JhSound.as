var §\x01§ = 473;
var §\x0f§ = 1;
class JhSound
{
   var sound;
   var volume = 100;
   var msg = false;
   function JhSound(mc)
   {
      this.sound = new Sound(mc);
   }
   function play(str, num)
   {
      this.message("play : " + str);
      if(num == undefined)
      {
         var num = 1;
      }
      this.sound.attachSound(str);
      this.sound.start(0,num);
   }
   function stop(str)
   {
      this.message("stop : " + str);
      this.sound.stop(str);
   }
   function allStop()
   {
      this.message("all stop");
      this.sound.stop();
   }
   function setVolume(num)
   {
      this.message("setVolume : " + num);
      this.volume = num;
      this.sound.setVolume(this.volume);
   }
   function soundOn()
   {
      this.message("soundOn");
      this.sound.setVolume(this.volume);
   }
   function soundOff()
   {
      this.message("soundOff");
      this.sound.setVolume(0);
   }
   function setMsg(bool)
   {
      if(bool)
      {
         this.msg = true;
      }
      else
      {
         this.msg = false;
      }
   }
   function message(str)
   {
      if(!this.msg)
      {
      }
   }
}
