var §\x01§ = 553;
var §\x0f§ = 1;
class OneTime
{
   var onPlay;
   var interval;
   var stime = 0;
   var etime = 1;
   var time = 1;
   var status = false;
   function OneTime(time)
   {
      this.time = time;
      if(time != undefined)
      {
         this.onStart();
      }
   }
   function onTime()
   {
      this.onPlay();
      if(++this.stime >= this.etime)
      {
         clearInterval(this.interval);
         this.status = false;
      }
   }
   function onStop()
   {
      clearInterval(this.interval);
      this.status = false;
   }
   function onStart()
   {
      if(!this.status)
      {
         this.stime = 0;
         this.status = true;
         this.interval = setInterval(this,"onTime",this.time * 1000);
      }
   }
   function set _time(num)
   {
      this.time = num;
      null;
   }
   function get _time()
   {
      return this.time;
   }
   function set _etime(num)
   {
      this.etime = num;
      null;
   }
   function get _etime()
   {
      return this.etime;
   }
}
