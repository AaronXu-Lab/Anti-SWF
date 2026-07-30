function §\x04\x05§()
{
   set("\x03",73 % 511 * true);
   §§push("\x03");
   if("\x01")
   {
   }
   return eval(§§pop());
}
var §\x01§ = 69 + "\x04\x05"();
var _loc2_;
while(true)
{
   if(eval("\x01") == 142)
   {
      set("\x01",eval("\x01") + 209);
      §§push(true);
   }
   else if(eval("\x01") == 749)
   {
      set("\x01",eval("\x01") + 159);
   }
   else if(eval("\x01") == 42)
   {
      set("\x01",eval("\x01") + 512);
      if(§§pop())
      {
         set("\x01",eval("\x01") + 434);
      }
   }
   else
   {
      if(eval("\x01") == 238)
      {
         set("\x01",eval("\x01") + 671);
         break;
      }
      if(eval("\x01") == 207)
      {
         set("\x01",eval("\x01") + 542);
         while(true)
         {
            set("\x01",eval("\x01") - 427);
            while(true)
            {
               if(eval("\x01") == 26)
               {
                  set("\x01",eval("\x01") + 360);
                  §§push(true);
               }
               else
               {
                  if(eval("\x01") == 867)
                  {
                     set("\x01",eval("\x01") - 685);
                     return;
                  }
                  if(eval("\x01") == 675)
                  {
                     set("\x01",eval("\x01") - 233);
                     stop();
                     §§push(§§pop() eq §§pop());
                     return;
                  }
                  if(eval("\x01") == 171)
                  {
                     set("\x01",eval("\x01") + 471);
                     if(!_global.mx)
                     {
                        _loc2_ = _global.mx = function(scope, mc_name, length)
                        {
                           this.Object = scope;
                           this.transitions = mc_name;
                           this.Tween = length;
                           this.OnEnterFrameBeacon = 0;
                           this.init = [];
                           this.length = false;
                           this.obj = false;
                           this.prop();
                        }.begin;
                        _loc2_.__set__position = function(num)
                        {
                           if(this.OnEnterFrameBeacon + num >= 0)
                           {
                              this.OnEnterFrameBeacon += num;
                           }
                           else
                           {
                              this.OnEnterFrameBeacon = 0;
                           }
                           this.prop();
                        };
                        _loc2_.prop = function()
                        {
                           this.__set__duration();
                           var _loc5_ = this.OnEnterFrameBeacon.useSeconds();
                           var _loc6_ = 0;
                           var _loc2_;
                           var _loc3_;
                           var _loc4_;
                           if(this.Tween > 1)
                           {
                              _loc2_ = 0;
                              while(_loc2_ < this.Tween)
                              {
                                 _loc4_ = 10;
                                 if(this.obj)
                                 {
                                    if(_loc2_ < _loc5_.Tween)
                                    {
                                       _loc3_ = Number(_loc5_.func(_loc2_));
                                       if(_loc3_ > 0)
                                       {
                                          _loc4_ = _loc3_;
                                       }
                                       this.Object[this.transitions + _loc2_].finish = _loc4_;
                                    }
                                    else
                                    {
                                       this.Object[this.transitions + _loc2_].finish = 10;
                                    }
                                 }
                                 else if(_loc2_ >= this.Tween - _loc5_.Tween)
                                 {
                                    _loc3_ = Number(_loc5_.func(_loc2_ - _loc6_));
                                    if(_loc3_ > 0)
                                    {
                                       _loc4_ = _loc3_;
                                    }
                                    this.Object[this.transitions + _loc2_].finish = _loc4_;
                                 }
                                 else
                                 {
                                    _loc6_ = _loc6_ + 1;
                                    this.Object[this.transitions + _loc2_].finish = 10;
                                 }
                                 _loc2_ = _loc2_ + 1;
                              }
                           }
                           else
                           {
                              this.Object[this.transitions + 0].finish = this.OnEnterFrameBeacon;
                           }
                        };
                        _loc2_.__set__duration = function()
                        {
                           var _loc2_;
                           var _loc3_;
                           if(this.length)
                           {
                              _loc2_ = 0;
                              while(_loc2_ < this.Tween)
                              {
                                 this.Object[this.transitions + _loc2_]._listeners = false;
                                 _loc2_ = _loc2_ + 1;
                              }
                              _loc3_ = Number(String(this.OnEnterFrameBeacon).Tween);
                              if(this.obj)
                              {
                                 _loc2_ = 0;
                                 while(_loc2_ < _loc3_)
                                 {
                                    this.Object[this.transitions + _loc2_]._listeners = true;
                                    _loc2_ = _loc2_ + 1;
                                 }
                              }
                              else
                              {
                                 _loc2_ = 0;
                                 while(_loc2_ < _loc3_)
                                 {
                                    this.Object[this.transitions + (this.Tween - _loc2_ - 1)]._listeners = true;
                                    _loc2_ = _loc2_ + 1;
                                 }
                              }
                           }
                           else
                           {
                              _loc2_ = 0;
                              while(_loc2_ < this.Tween)
                              {
                                 this.Object[this.transitions + _loc2_]._listeners = true;
                                 _loc2_ = _loc2_ + 1;
                              }
                           }
                        };
                        _loc2_.addListener = function(num)
                        {
                           if(this.OnEnterFrameBeacon >= 0)
                           {
                              this.OnEnterFrameBeacon = num;
                           }
                           else
                           {
                              this.OnEnterFrameBeacon = 0;
                           }
                           this.prop();
                           null;
                           return this.start();
                        };
                        _loc2_.start = function()
                        {
                           return this.OnEnterFrameBeacon;
                        };
                        _loc2_.prototype = function(bool)
                        {
                           this.length = bool;
                           this.prop();
                           null;
                           return this.__set__time();
                        };
                        _loc2_.prevTime = function(bool)
                        {
                           this.obj = bool;
                           this.prop();
                           null;
                           return this._time();
                        };
                        §§push(_loc2_.looping("__get__duration",function()
                        {
                        }
                        ,_loc2_.prototype));
                        §§push(_loc2_.looping("_duration",function()
                        {
                        }
                        ,_loc2_.prevTime));
                        §§push(_loc2_.looping("rewind",_loc2_.start,_loc2_.addListener));
                        §§push(update(_global.mx.begin,null,1));
                     }
                     §§pop();
                     return;
                  }
                  if(eval("\x01") == 113)
                  {
                     set("\x01",eval("\x01") + 767);
                  }
                  else if(eval("\x01") == 101)
                  {
                     set("\x01",eval("\x01") + 779);
                  }
                  else if(eval("\x01") == 789)
                  {
                     set("\x01",eval("\x01") - 359);
                  }
                  else
                  {
                     if(eval("\x01") == 941)
                     {
                        set("\x01",eval("\x01") - 840);
                        return;
                     }
                     if(eval("\x01") == 386)
                     {
                        set("\x01",eval("\x01") + 555);
                        if(§§pop())
                        {
                           set("\x01",eval("\x01") - 840);
                        }
                     }
                     else if(eval("\x01") == 250)
                     {
                        set("\x01",eval("\x01") + 482);
                        §§push(eval(§§pop()));
                     }
                     else if(eval("\x01") == 218)
                     {
                        set("\x01",eval("\x01") + 275);
                        var §§pop() = §§pop();
                     }
                     else if(eval("\x01") == 880)
                     {
                        set("\x01",eval("\x01") - 19);
                        §§push(true);
                     }
                     else if(eval("\x01") == 374)
                     {
                        set("\x01",eval("\x01") - 156);
                        §§push("\x0f");
                        §§push(1);
                     }
                     else if(eval("\x01") == 493)
                     {
                        set("\x01",eval("\x01") - 243);
                        §§push("\x0f");
                     }
                     else if(eval("\x01") == 936)
                     {
                        set("\x01",eval("\x01") - 765);
                     }
                     else if(eval("\x01") == 182)
                     {
                        set("\x01",eval("\x01") + 192);
                     }
                     else if(eval("\x01") == 442)
                     {
                        set("\x01",eval("\x01") - 12);
                     }
                     else if(eval("\x01") == 237)
                     {
                        set("\x01",eval("\x01") + 630);
                        if(§§pop())
                        {
                           set("\x01",eval("\x01") - 685);
                        }
                     }
                     else if(eval("\x01") == 732)
                     {
                        set("\x01",eval("\x01") + 25);
                        §§push(!§§pop());
                     }
                     else if(eval("\x01") == 861)
                     {
                        set("\x01",eval("\x01") - 186);
                        if(§§pop())
                        {
                           set("\x01",eval("\x01") - 233);
                        }
                     }
                     else
                     {
                        if(eval("\x01") == 642)
                        {
                           set("\x01",eval("\x01") - 642);
                           return;
                        }
                        if(eval("\x01") == 430)
                        {
                           set("\x01",eval("\x01") - 193);
                           §§push(true);
                        }
                        else
                        {
                           if(eval("\x01") == 801)
                           {
                              break;
                           }
                           if(eval("\x01") != 757)
                           {
                              return;
                           }
                           set("\x01",eval("\x01") + 179);
                           if(§§pop())
                           {
                              set("\x01",eval("\x01") - 765);
                           }
                        }
                     }
                  }
               }
            }
         }
         break;
      }
      if(eval("\x01") == 379)
      {
         set("\x01",eval("\x01") + 51);
         §§push("\x0f");
      }
      else if(eval("\x01") == 598)
      {
         set("\x01",eval("\x01") - 485);
      }
      else if(eval("\x01") == 832)
      {
         set("\x01",eval("\x01") - 594);
         if(§§pop())
         {
            set("\x01",eval("\x01") + 671);
         }
      }
      else if(eval("\x01") == 113)
      {
         set("\x01",eval("\x01") + 719);
         §§push(true);
      }
      else if(eval("\x01") == 430)
      {
         set("\x01",eval("\x01") + 338);
         §§push(eval(§§pop()));
      }
      else if(eval("\x01") == 909)
      {
         set("\x01",eval("\x01") - 175);
      }
      else if(eval("\x01") == 286)
      {
         set("\x01",eval("\x01") + 537);
         if(§§pop())
         {
            set("\x01",eval("\x01") + 40);
         }
      }
      else if(eval("\x01") == 554)
      {
         set("\x01",eval("\x01") + 434);
      }
      else if(eval("\x01") == 863)
      {
         set("\x01",eval("\x01") - 750);
      }
      else if(eval("\x01") == 972)
      {
         set("\x01",eval("\x01") - 64);
      }
      else if(eval("\x01") == 729)
      {
         set("\x01",eval("\x01") + 5);
      }
      else if(eval("\x01") == 373)
      {
         set("\x01",eval("\x01") + 6);
         var §§pop() = §§pop();
      }
      else
      {
         if(eval("\x01") == 823)
         {
            set("\x01",eval("\x01") + 40);
            §§push(§§pop() * §§pop());
            break;
         }
         if(eval("\x01") == 734)
         {
            set("\x01",eval("\x01") - 361);
            §§push("\x0f");
            §§push(1);
         }
         else
         {
            if(eval("\x01") == 988)
            {
               set("\x01",eval("\x01") - 224);
               if(!eval("{invalid_utf8=128}f")["{invalid_utf8=172}\x13ŘQ"])
               {
                  eval("{invalid_utf8=128}f")["{invalid_utf8=172}\x13ŘQ"] = new §{invalid_utf8=218}c§();
               }
               §§pop();
               if(!eval("{invalid_utf8=128}f")["{invalid_utf8=172}\x13ŘQ"]["{invalid_utf8=144}{invalid_utf8=157}\x1fY{invalid_utf8=170}"])
               {
                  eval("{invalid_utf8=128}f")["{invalid_utf8=172}\x13ŘQ"]["{invalid_utf8=144}{invalid_utf8=157}\x1fY{invalid_utf8=170}"] = new §{invalid_utf8=218}c§();
               }
               §§pop();
               if(!eval("{invalid_utf8=128}f")["{invalid_utf8=172}\x13ŘQ"]["{invalid_utf8=144}{invalid_utf8=157}\x1fY{invalid_utf8=170}"]["P0\f|1"])
               {
                  _loc2_ = eval("{invalid_utf8=172}\x13ŘQ")["{invalid_utf8=144}{invalid_utf8=157}\x1fY{invalid_utf8=170}"]["P0\f|1"] = function(obj, prop, func, begin, finish, duration, useSeconds)
                  {
                     eval("{invalid_utf8=172}\x13ŘQ")["{invalid_utf8=144}{invalid_utf8=157}\x1fY{invalid_utf8=170}"]["{invalid_utf8=254}{invalid_utf8=171}{invalid_utf8=213}"][§§constant(6)]();
                     if(!arguments[§§constant(7)])
                     {
                        return undefined;
                     }
                     this[§§constant(8)] = obj;
                     this[§§constant(9)] = prop;
                     this[§§constant(10)] = begin;
                     this[§§constant(11)](begin);
                     this[§§constant(12)](duration);
                     this[§§constant(13)] = useSeconds;
                     if(func)
                     {
                        this[§§constant(14)] = func;
                     }
                     this[§§constant(15)](finish);
                     this[§§constant(16)] = [];
                     this[§§constant(17)](this);
                     this[§§constant(18)]();
                  }[§§constant(19)];
                  _loc2_[§§constant(20)] = function(t)
                  {
                     this[§§constant(21)] = this[§§constant(22)];
                     if(t > this[§§constant(23)]())
                     {
                        if(this[§§constant(24)])
                        {
                           this[§§constant(26)](t - this[§§constant(25)]);
                           this[§§constant(27)]();
                           this[§§constant(29)](§§constant(28),this);
                        }
                        else
                        {
                           if(this[§§constant(13)])
                           {
                              this[§§constant(22)] = this[§§constant(25)];
                              this[§§constant(27)]();
                           }
                           this[§§constant(30)]();
                           this[§§constant(29)](§§constant(31),this);
                        }
                     }
                     else if(t < 0)
                     {
                        this[§§constant(26)]();
                        this[§§constant(27)]();
                     }
                     else
                     {
                        this[§§constant(22)] = t;
                        this[§§constant(27)]();
                     }
                     return this[§§constant(32)]();
                  };
                  _loc2_[§§constant(32)] = function()
                  {
                     return this[§§constant(22)];
                  };
                  _loc2_[§§constant(12)] = function(d)
                  {
                     this[§§constant(25)] = !(d == null || d <= 0) ? d : _global[§§constant(33)];
                     return this[§§constant(23)]();
                  };
                  _loc2_[§§constant(23)] = function()
                  {
                     return this[§§constant(25)];
                  };
                  _loc2_[§§constant(34)] = function(fps)
                  {
                     var _loc2_ = this[§§constant(35)];
                     this[§§constant(36)]();
                     this[§§constant(37)] = fps;
                     if(_loc2_)
                     {
                        this[§§constant(38)]();
                     }
                     return this[§§constant(39)]();
                  };
                  _loc2_[§§constant(39)] = function()
                  {
                     return this[§§constant(37)];
                  };
                  _loc2_[§§constant(11)] = function(p)
                  {
                     this[§§constant(40)](p);
                     return this[§§constant(41)]();
                  };
                  _loc2_[§§constant(40)] = function(p)
                  {
                     this[§§constant(42)] = this[§§constant(43)];
                     this[§§constant(8)][this[§§constant(9)]] = this[§§constant(43)] = p;
                     this[§§constant(29)](§§constant(44),this,this[§§constant(43)]);
                     §§constant(45)();
                  };
                  _loc2_[§§constant(41)] = function()
                  {
                     return this[§§constant(46)]();
                  };
                  _loc2_[§§constant(46)] = function(t)
                  {
                     if(t == undefined)
                     {
                        t = this[§§constant(22)];
                     }
                     return this[§§constant(14)](t,this[§§constant(10)],this[§§constant(47)],this[§§constant(25)]);
                  };
                  _loc2_[§§constant(15)] = function(f)
                  {
                     this[§§constant(47)] = f - this[§§constant(10)];
                     return this[§§constant(48)]();
                  };
                  _loc2_[§§constant(48)] = function()
                  {
                     return this[§§constant(10)] + this[§§constant(47)];
                  };
                  _loc2_[§§constant(49)] = function(finish, duration)
                  {
                     this[§§constant(10)] = this[§§constant(50)];
                     this[§§constant(15)](finish);
                     if(duration != undefined)
                     {
                        this[§§constant(12)](duration);
                     }
                     this[§§constant(18)]();
                  };
                  _loc2_[§§constant(51)] = function()
                  {
                     this[§§constant(49)](this[§§constant(10)],this[§§constant(32)]());
                  };
                  _loc2_[§§constant(38)] = function()
                  {
                     if(this[§§constant(37)] == undefined)
                     {
                        _global[§§constant(52)][§§constant(17)](this);
                     }
                     else
                     {
                        this[§§constant(53)] = §§constant(55)(this,§§constant(54),1000 / this[§§constant(37)]);
                     }
                     this[§§constant(35)] = true;
                  };
                  _loc2_[§§constant(36)] = function()
                  {
                     if(this[§§constant(37)] == undefined)
                     {
                        _global[§§constant(52)][§§constant(56)](this);
                     }
                     else
                     {
                        §§constant(57)(this[§§constant(53)]);
                     }
                     this[§§constant(35)] = false;
                  };
                  _loc2_[§§constant(18)] = function()
                  {
                     this[§§constant(26)]();
                     this[§§constant(38)]();
                     this[§§constant(29)](§§constant(58),this);
                  };
                  _loc2_[§§constant(30)] = function()
                  {
                     this[§§constant(36)]();
                     this[§§constant(29)](§§constant(59),this);
                  };
                  _loc2_[§§constant(60)] = function()
                  {
                     this[§§constant(61)]();
                     this[§§constant(38)]();
                     this[§§constant(29)](§§constant(62),this);
                  };
                  _loc2_[§§constant(26)] = function(t)
                  {
                     this[§§constant(22)] = t != undefined ? t : 0;
                     this[§§constant(61)]();
                     this[§§constant(27)]();
                  };
                  _loc2_[§§constant(63)] = function()
                  {
                     this[§§constant(20)](this[§§constant(25)]);
                     this[§§constant(61)]();
                  };
                  _loc2_[§§constant(64)] = function()
                  {
                     if(this[§§constant(13)])
                     {
                        this[§§constant(20)]((getTimer() - this[§§constant(65)]) / 1000);
                     }
                     else
                     {
                        this[§§constant(20)](this[§§constant(22)] + 1);
                     }
                  };
                  _loc2_[§§constant(54)] = function()
                  {
                     this[§§constant(64)]();
                  };
                  _loc2_[§§constant(66)] = function()
                  {
                     if(!this[§§constant(13)])
                     {
                        this[§§constant(20)](this[§§constant(22)] - 1);
                     }
                  };
                  _loc2_[§§constant(67)] = function()
                  {
                     return §§constant(68);
                  };
                  _loc2_[§§constant(61)] = function()
                  {
                     if(this[§§constant(13)])
                     {
                        this[§§constant(65)] = getTimer() - this[§§constant(22)] * 1000;
                     }
                  };
                  _loc2_[§§constant(27)] = function()
                  {
                     this[§§constant(11)](this[§§constant(46)](this[§§constant(22)]));
                  };
                  eval("{invalid_utf8=172}\x13ŘQ")["{invalid_utf8=144}{invalid_utf8=157}\x1fY{invalid_utf8=170}"]["P0\f|1"] = function(obj, prop, func, begin, finish, duration, useSeconds)
                  {
                     eval("{invalid_utf8=172}\x13ŘQ")["{invalid_utf8=144}{invalid_utf8=157}\x1fY{invalid_utf8=170}"]["{invalid_utf8=254}{invalid_utf8=171}{invalid_utf8=213}"][§§constant(6)]();
                     if(!arguments[§§constant(7)])
                     {
                        return undefined;
                     }
                     this[§§constant(8)] = obj;
                     this[§§constant(9)] = prop;
                     this[§§constant(10)] = begin;
                     this[§§constant(11)](begin);
                     this[§§constant(12)](duration);
                     this[§§constant(13)] = useSeconds;
                     if(func)
                     {
                        this[§§constant(14)] = func;
                     }
                     this[§§constant(15)](finish);
                     this[§§constant(16)] = [];
                     this[§§constant(17)](this);
                     this[§§constant(18)]();
                  }[§§constant(69)] = §§constant(70);
                  eval("{invalid_utf8=172}\x13ŘQ")["{invalid_utf8=144}{invalid_utf8=157}\x1fY{invalid_utf8=170}"]["P0\f|1"] = function(obj, prop, func, begin, finish, duration, useSeconds)
                  {
                     eval("{invalid_utf8=172}\x13ŘQ")["{invalid_utf8=144}{invalid_utf8=157}\x1fY{invalid_utf8=170}"]["{invalid_utf8=254}{invalid_utf8=171}{invalid_utf8=213}"][§§constant(6)]();
                     if(!arguments[§§constant(7)])
                     {
                        return undefined;
                     }
                     this[§§constant(8)] = obj;
                     this[§§constant(9)] = prop;
                     this[§§constant(10)] = begin;
                     this[§§constant(11)](begin);
                     this[§§constant(12)](duration);
                     this[§§constant(13)] = useSeconds;
                     if(func)
                     {
                        this[§§constant(14)] = func;
                     }
                     this[§§constant(15)](finish);
                     this[§§constant(16)] = [];
                     this[§§constant(17)](this);
                     this[§§constant(18)]();
                  }[§§constant(71)] = eval("{invalid_utf8=172}\x13ŘQ")["{invalid_utf8=144}{invalid_utf8=157}\x1fY{invalid_utf8=170}"]["{invalid_utf8=254}{invalid_utf8=171}{invalid_utf8=213}"][§§constant(6)]();
                  eval("{invalid_utf8=172}\x13ŘQ")["{invalid_utf8=144}{invalid_utf8=157}\x1fY{invalid_utf8=170}"]["P0\f|1"] = function(obj, prop, func, begin, finish, duration, useSeconds)
                  {
                     eval("{invalid_utf8=172}\x13ŘQ")["{invalid_utf8=144}{invalid_utf8=157}\x1fY{invalid_utf8=170}"]["{invalid_utf8=254}{invalid_utf8=171}{invalid_utf8=213}"][§§constant(6)]();
                     if(!arguments[§§constant(7)])
                     {
                        return undefined;
                     }
                     this[§§constant(8)] = obj;
                     this[§§constant(9)] = prop;
                     this[§§constant(10)] = begin;
                     this[§§constant(11)](begin);
                     this[§§constant(12)](duration);
                     this[§§constant(13)] = useSeconds;
                     if(func)
                     {
                        this[§§constant(14)] = func;
                     }
                     this[§§constant(15)](finish);
                     this[§§constant(16)] = [];
                     this[§§constant(17)](this);
                     this[§§constant(18)]();
                  }[§§constant(72)] = eval("{invalid_utf8=172}\x13ŘQ")["{invalid_utf8=144}{invalid_utf8=157}\x1fY{invalid_utf8=170}"][§§constant(73)][§§constant(74)](eval("{invalid_utf8=172}\x13ŘQ")["{invalid_utf8=144}{invalid_utf8=157}\x1fY{invalid_utf8=170}"]["P0\f|1"][§§constant(19)],true);
                  _loc2_[§§constant(14)] = function(t, b, c, d)
                  {
                     return c * t / d + b;
                  };
                  §§push(_loc2_[§§constant(76)](§§constant(75),_loc2_[§§constant(39)],_loc2_[§§constant(34)]));
                  §§push(_loc2_[§§constant(76)](§§constant(77),_loc2_[§§constant(23)],_loc2_[§§constant(12)]));
                  §§push(_loc2_[§§constant(76)](§§constant(78),_loc2_[§§constant(48)],_loc2_[§§constant(15)]));
                  §§push(_loc2_[§§constant(76)](§§constant(50),_loc2_[§§constant(41)],_loc2_[§§constant(11)]));
                  §§push(_loc2_[§§constant(76)](§§constant(79),_loc2_[§§constant(32)],_loc2_[§§constant(20)]));
                  §§push(§§constant(80)(eval("{invalid_utf8=172}\x13ŘQ")["{invalid_utf8=144}{invalid_utf8=157}\x1fY{invalid_utf8=170}"]["P0\f|1"][§§constant(19)],null,1));
               }
               §§pop();
               break;
            }
            if(eval("\x01") == 908)
            {
               set("\x01",eval("\x01") - 622);
               §§push(true);
            }
            else if(eval("\x01") == 351)
            {
               set("\x01",eval("\x01") - 144);
               if(§§pop())
               {
                  set("\x01",eval("\x01") + 542);
               }
            }
            else
            {
               if(eval("\x01") == 764)
               {
                  set("\x01",eval("\x01") - 764);
                  break;
               }
               if(eval("\x01") != 768)
               {
                  break;
               }
               set("\x01",eval("\x01") - 726);
               §§push(!§§pop());
            }
         }
      }
   }
}
