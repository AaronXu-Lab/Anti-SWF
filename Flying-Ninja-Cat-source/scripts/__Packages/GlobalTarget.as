function §\x04\x05§()
{
   set("\x03",1318 % 511 * true);
   §§push("\x03");
   if("\x01")
   {
   }
   return eval(§§pop());
}
var §\x01§ = 424 + "\x04\x05"();
var _loc2_;
while(true)
{
   if(eval("\x01") == 720)
   {
      set("\x01",eval("\x01") + 50);
      §§push(true);
   }
   else if(eval("\x01") == 658)
   {
      set("\x01",eval("\x01") - 37);
      §§push("\x0f");
   }
   else if(eval("\x01") == 62)
   {
      set("\x01",eval("\x01") + 274);
      §§push(!§§pop());
   }
   else if(eval("\x01") == 392)
   {
      set("\x01",eval("\x01") + 238);
      if(§§pop())
      {
         set("\x01",eval("\x01") + 240);
      }
   }
   else if(eval("\x01") == 770)
   {
      set("\x01",eval("\x01") - 134);
      if(§§pop())
      {
         set("\x01",eval("\x01") - 114);
      }
   }
   else if(eval("\x01") == 961)
   {
      set("\x01",eval("\x01") - 571);
   }
   else if(eval("\x01") == 522)
   {
      set("\x01",eval("\x01") - 419);
   }
   else if(eval("\x01") == 390)
   {
      set("\x01",eval("\x01") - 200);
      §§push("\x0f");
      §§push(1);
   }
   else
   {
      if(eval("\x01") == 636)
      {
         set("\x01",eval("\x01") - 114);
         break;
      }
      if(eval("\x01") == 103)
      {
         set("\x01",eval("\x01") + 289);
         §§push(true);
      }
      else if(eval("\x01") == 239)
      {
         set("\x01",eval("\x01") - 136);
      }
      else if(eval("\x01") == 870)
      {
         set("\x01",eval("\x01") - 480);
      }
      else if(eval("\x01") == 949)
      {
         set("\x01",eval("\x01") - 60);
      }
      else if(eval("\x01") == 621)
      {
         set("\x01",eval("\x01") - 559);
         §§push(eval(§§pop()));
      }
      else
      {
         if(eval("\x01") == 630)
         {
            set("\x01",eval("\x01") + 240);
            break;
         }
         if(eval("\x01") == 190)
         {
            set("\x01",eval("\x01") + 468);
            var §§pop() = §§pop();
         }
         else
         {
            if(eval("\x01") != 336)
            {
               if(eval("\x01") == 889)
               {
                  set("\x01",eval("\x01") - 304);
                  if(!_global.GlobalTarget)
                  {
                     _loc2_ = _global.GlobalTarget = function()
                     {
                     }.prototype;
                     _global.GlobalTarget = function()
                     {
                     }.rootFind = function(target)
                     {
                        var _loc2_ = [target];
                        while(target = target._parent)
                        {
                           _loc2_.push(target);
                        }
                        return _loc2_;
                     };
                     _global.GlobalTarget = function()
                     {
                     }.getxy = function(target)
                     {
                        var _loc4_ = GlobalTarget.rootFind(target);
                        var _loc2_ = 0;
                        var _loc3_ = 0;
                        var _loc1_;
                        for(var _loc5_ in _loc4_)
                        {
                           _loc1_ = _loc4_[_loc5_];
                           _loc2_ += _loc1_._x;
                           _loc3_ += _loc1_._y;
                        }
                        return {_x:_loc2_,_y:_loc3_};
                     };
                     _global.GlobalTarget = function()
                     {
                     }.getdiv = function(t1, t2)
                     {
                        var _loc1_ = GlobalTarget.getxy(t1);
                        var _loc2_ = GlobalTarget.getxy(t2);
                        var _loc3_ = Math.sqrt(Math.pow(_loc2_._x - _loc1_._x,2) + Math.pow(_loc2_._y - _loc1_._y,2));
                        return _loc3_;
                     };
                     _global.GlobalTarget = function()
                     {
                     }.getdivxy = function(t1, t2, s)
                     {
                        var _loc1_ = GlobalTarget.getxy(t1);
                        var _loc2_ = GlobalTarget.getxy(t2);
                        return _loc2_[s] - _loc1_[s];
                     };
                     _global.GlobalTarget = function()
                     {
                     }.getsec = function(t1, t2)
                     {
                        var _loc1_ = GlobalTarget.getxy(t1);
                        var _loc2_ = GlobalTarget.getxy(t2);
                        return Math.atan2(_loc2_._y - _loc1_._y,_loc2_._x - _loc1_._x);
                     };
                     _global.GlobalTarget = function()
                     {
                     }.union = function(to, o)
                     {
                        var _loc2_ = 0;
                        for(var _loc3_ in o)
                        {
                           _loc2_ = _loc2_ + 1;
                           to[_loc3_] = o[_loc3_];
                        }
                        return _loc2_;
                     };
                     §§push(ASSetPropFlags(_global.GlobalTarget.prototype,null,1));
                  }
                  §§pop();
                  break;
               }
               if(eval("\x01") == 585)
               {
                  set("\x01",eval("\x01") - 585);
               }
               break;
            }
            set("\x01",eval("\x01") + 613);
            if(§§pop())
            {
               set("\x01",eval("\x01") - 60);
            }
         }
      }
   }
}
