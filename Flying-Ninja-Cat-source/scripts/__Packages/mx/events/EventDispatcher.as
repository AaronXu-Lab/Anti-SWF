function §\x04\x05§()
{
   set("\x03",545 % 511 * true);
   §§push("\x03");
   if("\x01")
   {
   }
   return eval(§§pop());
}
var §\x01§ = 505 + "\x04\x05"();
var _loc2_;
while(true)
{
   if(eval("\x01") == 539)
   {
      set("\x01",eval("\x01") + 257);
      §§push(true);
   }
   else if(eval("\x01") == 240)
   {
      set("\x01",eval("\x01") + 643);
      if(§§pop())
      {
         set("\x01",eval("\x01") - 307);
      }
   }
   else
   {
      if(eval("\x01") == 82)
      {
         set("\x01",eval("\x01") + 88);
         break;
      }
      if(eval("\x01") == 972)
      {
         set("\x01",eval("\x01") - 839);
         §§push("\x0f");
         §§push(1);
      }
      else if(eval("\x01") == 499)
      {
         set("\x01",eval("\x01") + 212);
         §§push("\x0f");
      }
      else if(eval("\x01") == 253)
      {
         set("\x01",eval("\x01") - 246);
      }
      else if(eval("\x01") == 170)
      {
         set("\x01",eval("\x01") - 163);
      }
      else if(eval("\x01") == 133)
      {
         set("\x01",eval("\x01") + 366);
         var §§pop() = §§pop();
      }
      else if(eval("\x01") == 635)
      {
         set("\x01",eval("\x01") + 274);
         if(§§pop())
         {
            set("\x01",eval("\x01") - 393);
         }
      }
      else if(eval("\x01") == 796)
      {
         set("\x01",eval("\x01") - 714);
         if(§§pop())
         {
            set("\x01",eval("\x01") + 88);
         }
      }
      else if(eval("\x01") == 7)
      {
         set("\x01",eval("\x01") + 233);
         §§push(true);
      }
      else
      {
         if(eval("\x01") == 883)
         {
            set("\x01",eval("\x01") - 307);
            break;
         }
         if(eval("\x01") == 711)
         {
            set("\x01",eval("\x01") + 47);
            §§push(eval(§§pop()));
         }
         else if(eval("\x01") == 576)
         {
            set("\x01",eval("\x01") + 396);
         }
         else if(eval("\x01") == 128)
         {
            set("\x01",eval("\x01") + 844);
         }
         else if(eval("\x01") == 758)
         {
            set("\x01",eval("\x01") - 123);
            §§push(!§§pop());
         }
         else
         {
            if(eval("\x01") != 909)
            {
               if(eval("\x01") == 516)
               {
                  set("\x01",eval("\x01") + 288);
                  if(!_global.mx)
                  {
                     _global.mx = new Object();
                  }
                  §§pop();
                  if(!_global.mx.events)
                  {
                     _global.mx.events = new Object();
                  }
                  §§pop();
                  if(!_global.mx.events.EventDispatcher)
                  {
                     _loc2_ = mx.events.EventDispatcher = function()
                     {
                     }.prototype;
                     mx.events.EventDispatcher = function()
                     {
                     }._removeEventListener = function(queue, event, handler)
                     {
                        var _loc4_;
                        var _loc1_;
                        var _loc2_;
                        if(queue != undefined)
                        {
                           _loc4_ = queue.length;
                           _loc1_ = 0;
                           while(_loc1_ < _loc4_)
                           {
                              _loc2_ = queue[_loc1_];
                              if(_loc2_ == handler)
                              {
                                 queue.splice(_loc1_,1);
                                 return undefined;
                              }
                              _loc1_ = _loc1_ + 1;
                           }
                        }
                     };
                     mx.events.EventDispatcher = function()
                     {
                     }.initialize = function(object)
                     {
                        if(mx.events.EventDispatcher._fEventDispatcher == undefined)
                        {
                           mx.events.EventDispatcher._fEventDispatcher = new mx.events.EventDispatcher();
                        }
                        object.addEventListener = mx.events.EventDispatcher._fEventDispatcher.addEventListener;
                        object.removeEventListener = mx.events.EventDispatcher._fEventDispatcher.removeEventListener;
                        object.dispatchEvent = mx.events.EventDispatcher._fEventDispatcher.dispatchEvent;
                        object.dispatchQueue = mx.events.EventDispatcher._fEventDispatcher.dispatchQueue;
                     };
                     _loc2_.dispatchQueue = function(queueObj, eventObj)
                     {
                        var _loc7_ = "__q_" + eventObj.type;
                        var _loc4_ = queueObj[_loc7_];
                        var _loc5_;
                        var _loc1_;
                        var _loc3_;
                        if(_loc4_ != undefined)
                        {
                           for(_loc5_ in _loc4_)
                           {
                              _loc1_ = _loc4_[_loc5_];
                              _loc3_ = typeof _loc1_;
                              if(_loc3_ == "object" || _loc3_ == "movieclip")
                              {
                                 if(_loc1_.handleEvent != undefined)
                                 {
                                    _loc1_.handleEvent(eventObj);
                                 }
                                 if(_loc1_[eventObj.type] != undefined)
                                 {
                                    if(mx.events.EventDispatcher.exceptions[eventObj.type] == undefined)
                                    {
                                       _loc1_[eventObj.type](eventObj);
                                    }
                                 }
                              }
                              else
                              {
                                 _loc1_.apply(queueObj,[eventObj]);
                              }
                           }
                        }
                     };
                     _loc2_.dispatchEvent = function(eventObj)
                     {
                        if(eventObj.target == undefined)
                        {
                           eventObj.target = this;
                        }
                        this[eventObj.type + "Handler"](eventObj);
                        this.dispatchQueue(this,eventObj);
                     };
                     _loc2_.addEventListener = function(event, handler)
                     {
                        var _loc3_ = "__q_" + event;
                        if(this[_loc3_] == undefined)
                        {
                           this[_loc3_] = new Array();
                        }
                        _global.ASSetPropFlags(this,_loc3_,1);
                        mx.events.EventDispatcher._removeEventListener(this[_loc3_],event,handler);
                        this[_loc3_].push(handler);
                     };
                     _loc2_.removeEventListener = function(event, handler)
                     {
                        var _loc2_ = "__q_" + event;
                        mx.events.EventDispatcher._removeEventListener(this[_loc2_],event,handler);
                     };
                     mx.events.EventDispatcher = function()
                     {
                     }._fEventDispatcher = undefined;
                     mx.events.EventDispatcher = function()
                     {
                     }.exceptions = {move:1,draw:1,load:1};
                     §§push(ASSetPropFlags(mx.events.EventDispatcher.prototype,null,1));
                  }
                  §§pop();
                  break;
               }
               if(eval("\x01") == 804)
               {
                  set("\x01",eval("\x01") - 804);
               }
               break;
            }
            set("\x01",eval("\x01") - 393);
         }
      }
   }
}
