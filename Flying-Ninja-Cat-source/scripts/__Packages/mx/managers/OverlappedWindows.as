function §\x04\x05§()
{
   set("\x03",1410 % 511 * true);
   §§push("\x03");
   if("\x01")
   {
   }
   return eval(§§pop());
}
var §\x01§ = 294 + "\x04\x05"();
var _loc2_;
while(true)
{
   if(eval("\x01") == 682)
   {
      set("\x01",eval("\x01") - 114);
      §§push(true);
   }
   else if(eval("\x01") == 568)
   {
      set("\x01",eval("\x01") + 152);
      if(§§pop())
      {
         set("\x01",eval("\x01") - 360);
      }
   }
   else if(eval("\x01") == 692)
   {
      set("\x01",eval("\x01") + 122);
      §§push(!§§pop());
   }
   else if(eval("\x01") == 44)
   {
      set("\x01",eval("\x01") + 647);
      §§push("\x0f");
      §§push(1);
   }
   else if(eval("\x01") == 350)
   {
      set("\x01",eval("\x01") - 306);
   }
   else if(eval("\x01") == 814)
   {
      set("\x01",eval("\x01") - 533);
      if(§§pop())
      {
         set("\x01",eval("\x01") + 694);
      }
   }
   else
   {
      if(eval("\x01") == 720)
      {
         set("\x01",eval("\x01") - 360);
         break;
      }
      if(eval("\x01") == 94)
      {
         set("\x01",eval("\x01") + 598);
         §§push(eval(§§pop()));
      }
      else if(eval("\x01") == 645)
      {
         set("\x01",eval("\x01") - 559);
      }
      else if(eval("\x01") == 281)
      {
         set("\x01",eval("\x01") + 694);
      }
      else if(eval("\x01") == 997)
      {
         set("\x01",eval("\x01") - 903);
         §§push("\x0f");
      }
      else if(eval("\x01") == 554)
      {
         set("\x01",eval("\x01") - 212);
         if(§§pop())
         {
            set("\x01",eval("\x01") + 213);
         }
      }
      else if(eval("\x01") == 360)
      {
         set("\x01",eval("\x01") - 274);
      }
      else if(eval("\x01") == 691)
      {
         set("\x01",eval("\x01") + 306);
         var §§pop() = §§pop();
      }
      else if(eval("\x01") == 86)
      {
         set("\x01",eval("\x01") + 468);
         §§push(true);
      }
      else
      {
         if(eval("\x01") == 975)
         {
            set("\x01",eval("\x01") - 935);
            if(!_global.mx)
            {
               _global.mx = new Object();
            }
            §§pop();
            if(!_global.mx.managers)
            {
               _global.mx.managers = new Object();
            }
            §§pop();
            if(!_global.mx.managers.OverlappedWindows)
            {
               _loc2_ = mx.managers.OverlappedWindows = function()
               {
               }.prototype;
               mx.managers.OverlappedWindows = function()
               {
               }.checkIdle = function(Void)
               {
                  if(mx.managers.SystemManager.idleFrames > 10)
                  {
                     mx.managers.SystemManager.dispatchEvent({type:"idle"});
                  }
                  else
                  {
                     mx.managers.SystemManager.idleFrames++;
                  }
               };
               mx.managers.OverlappedWindows = function()
               {
               }.__addEventListener = function(e, o, l)
               {
                  if(e == "idle")
                  {
                     if(mx.managers.SystemManager.interval == undefined)
                     {
                        mx.managers.SystemManager.interval = setInterval(mx.managers.SystemManager.checkIdle,100);
                     }
                  }
                  mx.managers.SystemManager._xAddEventListener(e,o,l);
               };
               mx.managers.OverlappedWindows = function()
               {
               }.__removeEventListener = function(e, o, l)
               {
                  if(e == "idle")
                  {
                     if(mx.managers.SystemManager._xRemoveEventListener(e,o,l) == 0)
                     {
                        clearInterval(mx.managers.SystemManager.interval);
                     }
                  }
                  else
                  {
                     mx.managers.SystemManager._xRemoveEventListener(e,o,l);
                  }
               };
               mx.managers.OverlappedWindows = function()
               {
               }.onMouseDown = function(Void)
               {
                  mx.managers.SystemManager.idleFrames = 0;
                  mx.managers.SystemManager.isMouseDown = true;
                  var _loc5_ = _root;
                  var _loc3_;
                  var _loc8_ = _root._xmouse;
                  var _loc7_ = _root._ymouse;
                  var _loc6_;
                  var _loc4_;
                  var _loc2_;
                  if(mx.managers.SystemManager.form.modalWindow == undefined)
                  {
                     if(mx.managers.SystemManager.forms.length > 1)
                     {
                        _loc6_ = mx.managers.SystemManager.forms.length;
                        _loc4_ = 0;
                        while(_loc4_ < _loc6_)
                        {
                           _loc2_ = mx.managers.SystemManager.forms[_loc4_];
                           if(_loc2_._visible)
                           {
                              if(_loc2_.hitTest(_loc8_,_loc7_))
                              {
                                 if(_loc3_ == undefined)
                                 {
                                    _loc3_ = _loc2_.getDepth();
                                    _loc5_ = _loc2_;
                                 }
                                 else if(_loc3_ < _loc2_.getDepth())
                                 {
                                    _loc3_ = _loc2_.getDepth();
                                    _loc5_ = _loc2_;
                                 }
                              }
                           }
                           _loc4_ = _loc4_ + 1;
                        }
                        if(_loc5_ != mx.managers.SystemManager.form)
                        {
                           mx.managers.SystemManager.activate(_loc5_);
                        }
                     }
                  }
                  var _loc9_ = mx.managers.SystemManager.form;
                  _loc9_.focusManager._onMouseDown();
               };
               mx.managers.OverlappedWindows = function()
               {
               }.onMouseMove = function(Void)
               {
                  mx.managers.SystemManager.idleFrames = 0;
               };
               mx.managers.OverlappedWindows = function()
               {
               }.onMouseUp = function(Void)
               {
                  mx.managers.SystemManager.isMouseDown = false;
                  mx.managers.SystemManager.idleFrames = 0;
               };
               mx.managers.OverlappedWindows = function()
               {
               }.activate = function(f)
               {
                  var _loc1_;
                  if(mx.managers.SystemManager.form != undefined)
                  {
                     if(mx.managers.SystemManager.form != f && mx.managers.SystemManager.forms.length > 1)
                     {
                        _loc1_ = mx.managers.SystemManager.form;
                        _loc1_.focusManager.deactivate();
                     }
                  }
                  mx.managers.SystemManager.form = f;
                  f.focusManager.activate();
               };
               mx.managers.OverlappedWindows = function()
               {
               }.deactivate = function(f)
               {
                  var _loc5_;
                  var _loc3_;
                  var _loc1_;
                  var _loc2_;
                  if(mx.managers.SystemManager.form != undefined)
                  {
                     if(mx.managers.SystemManager.form == f && mx.managers.SystemManager.forms.length > 1)
                     {
                        _loc5_ = mx.managers.SystemManager.form;
                        _loc5_.focusManager.deactivate();
                        _loc3_ = mx.managers.SystemManager.forms.length;
                        _loc1_ = 0;
                        while(_loc1_ < _loc3_)
                        {
                           if(mx.managers.SystemManager.forms[_loc1_] == f)
                           {
                              _loc1_ += 1;
                              while(_loc1_ < _loc3_)
                              {
                                 if(mx.managers.SystemManager.forms[_loc1_]._visible == true)
                                 {
                                    _loc2_ = mx.managers.SystemManager.forms[_loc1_];
                                 }
                                 _loc1_ = _loc1_ + 1;
                              }
                              mx.managers.SystemManager.form = _loc2_;
                              break;
                           }
                           if(mx.managers.SystemManager.forms[_loc1_]._visible == true)
                           {
                              _loc2_ = mx.managers.SystemManager.forms[_loc1_];
                           }
                           _loc1_ = _loc1_ + 1;
                        }
                        _loc5_ = mx.managers.SystemManager.form;
                        _loc5_.focusManager.activate();
                     }
                  }
               };
               mx.managers.OverlappedWindows = function()
               {
               }.addFocusManager = function(f)
               {
                  mx.managers.SystemManager.forms.push(f);
                  mx.managers.SystemManager.activate(f);
               };
               mx.managers.OverlappedWindows = function()
               {
               }.removeFocusManager = function(f)
               {
                  var _loc3_ = mx.managers.SystemManager.forms.length;
                  var _loc1_;
                  _loc1_ = 0;
                  while(_loc1_ < _loc3_)
                  {
                     if(mx.managers.SystemManager.forms[_loc1_] == f)
                     {
                        if(mx.managers.SystemManager.form == f)
                        {
                           mx.managers.SystemManager.deactivate(f);
                        }
                        mx.managers.SystemManager.forms.splice(_loc1_,1);
                        return undefined;
                     }
                     _loc1_ = _loc1_ + 1;
                  }
               };
               mx.managers.OverlappedWindows = function()
               {
               }.enableOverlappedWindows = function()
               {
                  if(!mx.managers.OverlappedWindows.initialized)
                  {
                     mx.managers.OverlappedWindows.initialized = true;
                     mx.managers.SystemManager.checkIdle = mx.managers.OverlappedWindows.checkIdle;
                     mx.managers.SystemManager.__addEventListener = mx.managers.OverlappedWindows.__addEventListener;
                     mx.managers.SystemManager.__removeEventListener = mx.managers.OverlappedWindows.__removeEventListener;
                     mx.managers.SystemManager.onMouseDown = mx.managers.OverlappedWindows.onMouseDown;
                     mx.managers.SystemManager.onMouseMove = mx.managers.OverlappedWindows.onMouseMove;
                     mx.managers.SystemManager.onMouseUp = mx.managers.OverlappedWindows.onMouseUp;
                     mx.managers.SystemManager.activate = mx.managers.OverlappedWindows.activate;
                     mx.managers.SystemManager.deactivate = mx.managers.OverlappedWindows.deactivate;
                     mx.managers.SystemManager.addFocusManager = mx.managers.OverlappedWindows.addFocusManager;
                     mx.managers.SystemManager.removeFocusManager = mx.managers.OverlappedWindows.removeFocusManager;
                  }
               };
               mx.managers.OverlappedWindows = function()
               {
               }.initialized = false;
               mx.managers.OverlappedWindows = function()
               {
               }.SystemManagerDependency = mx.managers.SystemManager;
               §§push(ASSetPropFlags(mx.managers.OverlappedWindows.prototype,null,1));
            }
            §§pop();
            break;
         }
         if(eval("\x01") != 555)
         {
            if(eval("\x01") == 342)
            {
               set("\x01",eval("\x01") + 213);
               break;
            }
            if(eval("\x01") == 40)
            {
               set("\x01",eval("\x01") - 40);
            }
            break;
         }
         set("\x01",eval("\x01") - 511);
      }
   }
}
