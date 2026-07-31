var §\x01§ = 677;
var §\x0f§ = 1;
class GameMode
{
   var scope;
   var modearr;
   var listener = new Object();
   var value = "";
   static var mode = "normal";
   function GameMode(scope)
   {
      this.scope = scope;
      this.modearr = [];
   }
   function addMode(input, modename)
   {
      this.modearr.push([String(input).toUpperCase(),modename]);
   }
   function checkOn()
   {
      this.listener.onKeyDown = Delegate.create(this,this.checkMode);
      Key.addListener(this.listener);
   }
   function checkMode(key)
   {
      if(Key.isDown(13))
      {
         var _loc2_ = 0;
         while(_loc2_ < this.modearr.length)
         {
            if(this.modearr[_loc2_][0] == this.value)
            {
               GameMode.mode = this.modearr[_loc2_][1];
               this.scope.sound.play("snd_best");
               this.scope.mode2x._y = 10;
            }
            _loc2_ = _loc2_ + 1;
         }
         this.value = "";
      }
      else
      {
         this.value += String.fromCharCode(Key.getCode());
      }
   }
   function checkOff()
   {
      var _loc2_ = this;
      Key.removeListener(this.listener);
      delete this.listener.onKeyDown;
   }
}
