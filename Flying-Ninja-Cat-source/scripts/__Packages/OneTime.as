function §\x04\x05§()
{
   set("\x03",688 % 511 * true);
   §§push("\x03");
   if("\x01")
   {
   }
   return eval(§§pop());
}
var §\x01§ = 533 + "\x04\x05"();
var _loc2_;
while(true)
{
   if(eval("\x01") == 710)
   {
      set("\x01",eval("\x01") - 23);
      §§push(true);
   }
   else
   {
      if(eval("\x01") == 563)
      {
         set("\x01",eval("\x01") - 10);
         if(!_global.OneTime)
         {
            _loc2_ = _global.OneTime = function(time)
            {
               this.time = time;
               if(time != undefined)
               {
                  this.onStart();
               }
            }.prototype;
            _loc2_.onTime = function()
            {
               this.onPlay();
               if(++this.stime >= this.etime)
               {
                  clearInterval(this.interval);
                  this.status = false;
               }
            };
            _loc2_.onStop = function()
            {
               clearInterval(this.interval);
               this.status = false;
            };
            _loc2_.onStart = function()
            {
               if(!this.status)
               {
                  this.stime = 0;
                  this.status = true;
                  this.interval = setInterval(this,"onTime",this.time * 1000);
               }
            };
            _loc2_.__set___time = function(num)
            {
               this.time = num;
               null;
               return this._time;
            };
            _loc2_.__get___time = function()
            {
               return this.time;
            };
            _loc2_.__set___etime = function(num)
            {
               this.etime = num;
               null;
               return this._etime;
            };
            _loc2_.__get___etime = function()
            {
               return this.etime;
            };
            _loc2_.stime = 0;
            _loc2_.etime = 1;
            _loc2_.time = 1;
            _loc2_.status = false;
            §§push(_loc2_.addProperty("_etime",_loc2_.__get___etime,_loc2_.__set___etime));
            §§push(_loc2_.addProperty("_time",_loc2_.__get___time,_loc2_.__set___time));
            §§push(ASSetPropFlags(_global.OneTime.prototype,null,1));
         }
         §§pop();
         break;
      }
      if(eval("\x01") == 421)
      {
         set("\x01",eval("\x01") - 221);
         §§push(eval(§§pop()));
      }
      else if(eval("\x01") == 598)
      {
         set("\x01",eval("\x01") - 35);
      }
      else
      {
         if(eval("\x01") == 940)
         {
            set("\x01",eval("\x01") - 233);
            break;
         }
         if(eval("\x01") == 687)
         {
            set("\x01",eval("\x01") + 253);
            if(§§pop())
            {
               set("\x01",eval("\x01") - 233);
            }
         }
         else if(eval("\x01") == 550)
         {
            set("\x01",eval("\x01") + 48);
            if(§§pop())
            {
               set("\x01",eval("\x01") - 35);
            }
         }
         else if(eval("\x01") == 134)
         {
            set("\x01",eval("\x01") + 287);
            §§push("\x0f");
         }
         else if(eval("\x01") == 707)
         {
            set("\x01",eval("\x01") + 275);
         }
         else if(eval("\x01") == 366)
         {
            set("\x01",eval("\x01") + 477);
         }
         else if(eval("\x01") == 982)
         {
            set("\x01",eval("\x01") - 536);
            §§push(true);
         }
         else if(eval("\x01") == 843)
         {
            set("\x01",eval("\x01") + 75);
            §§push("\x0f");
            §§push(1);
         }
         else if(eval("\x01") == 637)
         {
            set("\x01",eval("\x01") + 345);
         }
         else
         {
            if(eval("\x01") == 91)
            {
               set("\x01",eval("\x01") + 275);
               prevFrame();
               break;
            }
            if(eval("\x01") == 446)
            {
               set("\x01",eval("\x01") - 355);
               if(§§pop())
               {
                  set("\x01",eval("\x01") + 275);
               }
            }
            else if(eval("\x01") == 319)
            {
               set("\x01",eval("\x01") + 524);
            }
            else if(eval("\x01") == 200)
            {
               set("\x01",eval("\x01") + 350);
               §§push(!§§pop());
            }
            else
            {
               if(eval("\x01") == 553)
               {
                  set("\x01",eval("\x01") - 553);
                  break;
               }
               if(eval("\x01") != 918)
               {
                  break;
               }
               set("\x01",eval("\x01") - 784);
               var §§pop() = §§pop();
            }
         }
      }
   }
}
