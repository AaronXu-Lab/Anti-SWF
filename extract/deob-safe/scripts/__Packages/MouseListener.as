var §\x01§ = 90;
var §\x0f§ = 1;
class MouseListener
{
   var onMouseDown;
   var onMouseUp;
   var onMouseMove;
   var listener = new Object();
   var use = true;
   function MouseListener()
   {
   }
   function onControl(bool)
   {
      this.use = bool;
      if(bool)
      {
         if(this.onMouseDown != undefined)
         {
            this.listener.onMouseDown = this.onMouseDown;
         }
         if(this.onMouseUp != undefined)
         {
            this.listener.onMouseUp = this.onMouseUp;
         }
         if(this.onMouseMove != undefined)
         {
            this.listener.onMouseMove = this.onMouseMove;
         }
         Mouse.addListener(this.listener);
      }
      else
      {
         delete this.listener.onMouseDown;
         delete this.listener.onMouseUp;
         delete this.listener.onMouseMove;
         Mouse.removeListener(this.listener);
      }
   }
   function set _use(bool)
   {
      if(bool)
      {
         this.onControl(true);
      }
      else
      {
         this.onControl(false);
      }
      null;
   }
   function get _use()
   {
      return this.use;
   }
}
