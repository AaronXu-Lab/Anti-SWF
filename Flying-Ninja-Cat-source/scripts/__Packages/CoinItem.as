function §\x04\x05§()
{
   set("\x03",1682 % 511 * true);
   §§push("\x03");
   if("\x01")
   {
   }
   return eval(§§pop());
}
var §\x01§ = 463 + "\x04\x05"();
var _loc2_;
while(true)
{
   if(eval("\x01") == 612)
   {
      set("\x01",eval("\x01") - 18);
      §§push(true);
   }
   else if(eval("\x01") == 923)
   {
      set("\x01",eval("\x01") - 411);
      if(§§pop())
      {
         set("\x01",eval("\x01") + 105);
      }
   }
   else if(eval("\x01") == 438)
   {
      set("\x01",eval("\x01") + 202);
   }
   else
   {
      if(eval("\x01") == 20)
      {
         set("\x01",eval("\x01") + 336);
         if(!_global.CoinItem)
         {
            _loc2_ = _global.CoinItem = function(stage)
            {
               this.stage = stage.createEmptyMovieClip("item",1);
               this.effect = stage.createEmptyMovieClip("effect",2);
               this.itemdata = new ItemData();
               this.itemwait = [];
               this.itemarr = [];
               this.boxarr = [];
               this.parr = [];
            }.prototype;
            _loc2_.addItem = function(map, testitem)
            {
               var _loc3_;
               var _loc2_;
               if(this.itemwait.length <= 0)
               {
                  _loc3_ = [];
                  if(testitem != undefined)
                  {
                     _loc3_ = testitem;
                  }
                  else
                  {
                     _loc3_ = this.itemdata.getItem(map);
                  }
                  _loc2_ = 0;
                  while(_loc2_ < _loc3_.length)
                  {
                     this.itemwait.push(_loc3_[_loc2_]);
                     _loc2_ = _loc2_ + 1;
                  }
                  if(this.pitem < 8)
                  {
                     this.pitem = this.pitem + 1;
                  }
                  else
                  {
                     this.pitem = 0;
                  }
                  this.parr[this.pitem] = this.getItemNum(_loc3_);
                  if(this.parr[this.pitem] <= 0)
                  {
                     this.parr[this.pitem] = -1;
                  }
               }
            };
            _loc2_.createItem = function(x, y)
            {
               var _loc4_ = [];
               var _loc6_ = [];
               _loc4_ = _loc4_.concat(this.itemwait.shift());
               var _loc5_;
               var _loc2_;
               var _loc3_;
               if(_loc4_.length > 0)
               {
                  _loc5_ = this.stage.createEmptyMovieClip("item" + this.depth,this.depth++);
                  _loc5_._x = x;
                  _loc5_._y = y;
                  _loc2_ = 0;
                  while(_loc2_ < _loc4_.length)
                  {
                     _loc3_ = _loc5_.attachMovie("id_item","item_" + _loc2_,_loc2_);
                     if(_loc4_[_loc2_] < 100)
                     {
                        _loc3_.gotoAndStop(1);
                     }
                     else
                     {
                        _loc3_.gotoAndStop(2);
                        _loc4_[_loc2_] -= 100;
                     }
                     _loc3_._x = -58.5 + _loc4_[_loc2_] % 4 * 37.5;
                     _loc3_._y = -480 + Math.floor(_loc4_[_loc2_] / 4) * 37;
                     _loc3_.cacheAsBitmap = true;
                     _loc3_.pitem = this.pitem;
                     _loc6_.push(_loc3_);
                     _loc2_ = _loc2_ + 1;
                  }
                  _loc5_.cacheAsBitmap = true;
                  this.itemarr.push(_loc6_);
                  this.boxarr.push(_loc5_);
               }
            };
            _loc2_.eatItem = function(mc)
            {
               var _loc3_ = 0;
               var _loc2_;
               while(_loc3_ < this.itemarr.length)
               {
                  _loc2_ = 0;
                  while(_loc2_ < this.itemarr[_loc3_].length)
                  {
                     if(mc.hitTest(this.itemarr[_loc3_][_loc2_]))
                     {
                        if(this.itemarr[_loc3_][_loc2_]._currentframe == 1)
                        {
                           this.parr[this.itemarr[_loc3_][_loc2_].pitem]--;
                        }
                        if(this.itemarr[_loc3_][_loc2_]._currentframe == 1)
                        {
                           this.addPoint(2);
                        }
                        else
                        {
                           this.addPoint(1);
                        }
                        this.onBonus();
                        this.itemarr[_loc3_][_loc2_].coin.gotoAndStop(2);
                        this.itemarr[_loc3_].splice(_loc2_,1);
                        _loc2_ = _loc2_ - 1;
                     }
                     _loc2_ = _loc2_ + 1;
                  }
                  _loc3_ = _loc3_ + 1;
               }
            };
            _loc2_.deleteItem = function(x)
            {
               var _loc2_ = 0;
               while(_loc2_ < this.boxarr.length)
               {
                  if(this.boxarr[_loc2_]._x < x)
                  {
                     this.itemarr.splice(_loc2_,1);
                     this.boxarr[_loc2_].removeMovieClip();
                     this.boxarr.splice(_loc2_,1);
                     _loc2_ = _loc2_ - 1;
                  }
                  _loc2_ = _loc2_ + 1;
               }
            };
            _loc2_.onBonus = function()
            {
               var _loc2_ = 0;
               while(_loc2_ < this.parr.length)
               {
                  if(this.parr[_loc2_] == 0)
                  {
                     this.addPoint(3);
                     this.bonusEffect();
                     this.parr[_loc2_] = -1;
                  }
                  _loc2_ = _loc2_ + 1;
               }
            };
            _loc2_.getItemNum = function(item)
            {
               var _loc4_ = 0;
               var _loc2_ = 0;
               var _loc1_;
               while(_loc2_ < item.length)
               {
                  _loc1_ = 0;
                  while(_loc1_ < item[_loc2_].length)
                  {
                     if(item[_loc2_][_loc1_] < 100)
                     {
                        _loc4_ = _loc4_ + 1;
                     }
                     _loc1_ = _loc1_ + 1;
                  }
                  _loc2_ = _loc2_ + 1;
               }
               return _loc4_;
            };
            _loc2_.__get___itemarr = function()
            {
               return this.itemarr;
            };
            _loc2_.__set___itemarr = function(arr)
            {
               this.itemarr = arr;
               return this._itemarr;
            };
            _loc2_.__get___boxarr = function()
            {
               return this.boxarr;
            };
            _loc2_.__set___boxarr = function(arr)
            {
               this.boxarr = arr;
               return this._boxarr;
            };
            _loc2_.depth = 1;
            _loc2_.depthe = 1;
            _loc2_.pitem = 0;
            _loc2_.bonus = false;
            §§push(_loc2_.addProperty("_boxarr",_loc2_.__get___boxarr,_loc2_.__set___boxarr));
            §§push(_loc2_.addProperty("_itemarr",_loc2_.__get___itemarr,_loc2_.__set___itemarr));
            §§push(ASSetPropFlags(_global.CoinItem.prototype,null,1));
         }
         §§pop();
         break;
      }
      if(eval("\x01") == 534)
      {
         set("\x01",eval("\x01") - 514);
      }
      else if(eval("\x01") == 594)
      {
         set("\x01",eval("\x01") - 214);
         if(§§pop())
         {
            set("\x01",eval("\x01") + 192);
         }
      }
      else if(eval("\x01") == 230)
      {
         set("\x01",eval("\x01") + 348);
         §§push(eval(§§pop()));
      }
      else if(eval("\x01") == 617)
      {
         set("\x01",eval("\x01") - 180);
      }
      else if(eval("\x01") == 603)
      {
         set("\x01",eval("\x01") - 166);
      }
      else if(eval("\x01") == 573)
      {
         set("\x01",eval("\x01") - 343);
         §§push("\x0f");
      }
      else
      {
         if(eval("\x01") == 380)
         {
            set("\x01",eval("\x01") + 192);
            toggleHighQuality();
            §§pop()[§§pop() lt §§pop()]();
            if(_loc8_ != undefined)
            {
               (_global.CoinItem = function(stage)
               {
                  this.stage = stage.createEmptyMovieClip("item",1);
                  this.effect = stage.createEmptyMovieClip("effect",2);
                  this.itemdata = new ItemData();
                  this.itemwait = [];
                  this.itemarr = [];
                  this.boxarr = [];
                  this.parr = [];
               })[§§constant(51)](_loc8_);
               (_global.CoinItem = function(stage)
               {
                  this.stage = stage.createEmptyMovieClip("item",1);
                  this.effect = stage.createEmptyMovieClip("effect",2);
                  this.itemdata = new ItemData();
                  this.itemwait = [];
                  this.itemarr = [];
                  this.boxarr = [];
                  this.parr = [];
               })[§§constant(52)](_loc9_,_loc9_,(_global.CoinItem = function(stage)
               {
                  this.stage = stage.createEmptyMovieClip("item",1);
                  this.effect = stage.createEmptyMovieClip("effect",2);
                  this.itemdata = new ItemData();
                  this.itemwait = [];
                  this.itemarr = [];
                  this.boxarr = [];
                  this.parr = [];
               })[§§constant(32)]() - _loc9_,(_global.CoinItem = function(stage)
               {
                  this.stage = stage.createEmptyMovieClip("item",1);
                  this.effect = stage.createEmptyMovieClip("effect",2);
                  this.itemdata = new ItemData();
                  this.itemwait = [];
                  this.itemarr = [];
                  this.boxarr = [];
                  this.parr = [];
               })[§§constant(33)]() - _loc9_);
               (_global.CoinItem = function(stage)
               {
                  this.stage = stage.createEmptyMovieClip("item",1);
                  this.effect = stage.createEmptyMovieClip("effect",2);
                  this.itemdata = new ItemData();
                  this.itemwait = [];
                  this.itemarr = [];
                  this.boxarr = [];
                  this.parr = [];
               })[§§constant(53)]();
            }
            §§pop()[§§pop()] = §§pop();
            _loc2_[§§constant(38)] = function(c1, c2, c3, c4, c5, c6)
            {
               var _loc3_ = this[§§constant(32)]();
               var _loc2_ = this[§§constant(33)]();
               this[§§constant(51)](c1);
               this[§§constant(52)](0,0,_loc3_,_loc2_);
               this[§§constant(52)](1,0,_loc3_ - 1,_loc2_);
               this[§§constant(53)]();
               this[§§constant(51)](c2);
               this[§§constant(52)](1,0,_loc3_ - 1,1);
               this[§§constant(53)]();
               this[§§constant(51)](c3);
               this[§§constant(52)](1,_loc2_ - 1,_loc3_ - 1,_loc2_);
               this[§§constant(53)]();
               this[§§constant(51)](c4);
               this[§§constant(52)](1,1,_loc3_ - 1,2);
               this[§§constant(53)]();
               this[§§constant(51)](c5);
               this[§§constant(52)](1,_loc2_ - 2,_loc3_ - 1,_loc2_ - 1);
               this[§§constant(53)]();
               this[§§constant(51)](c6);
               this[§§constant(52)](1,2,_loc3_ - 1,_loc2_ - 2);
               this[§§constant(52)](2,2,_loc3_ - 2,_loc2_ - 2);
               this[§§constant(53)]();
            };
            _global.CoinItem = function(stage)
            {
               this.stage = stage.createEmptyMovieClip("item",1);
               this.effect = stage.createEmptyMovieClip("effect",2);
               this.itemdata = new ItemData();
               this.itemwait = [];
               this.itemarr = [];
               this.boxarr = [];
               this.parr = [];
            }[§§constant(54)] = function()
            {
               eval("{invalid_utf8=179}e")[§§constant(55)][§§constant(56)][§§constant(57)][§§constant(58)]();
               _global[§§constant(21)][§§constant(59)] = eval("{invalid_utf8=179}e")["{invalid_utf8=224} /{invalid_utf8=205}"][§§constant(4)][§§constant(5)];
               _global[§§constant(60)][§§constant(5)] = true;
               return true;
            };
            _global.CoinItem = function(stage)
            {
               this.stage = stage.createEmptyMovieClip("item",1);
               this.effect = stage.createEmptyMovieClip("effect",2);
               this.itemdata = new ItemData();
               this.itemwait = [];
               this.itemarr = [];
               this.boxarr = [];
               this.parr = [];
            }[§§constant(61)] = §§constant(5);
            _global.CoinItem = function(stage)
            {
               this.stage = stage.createEmptyMovieClip("item",1);
               this.effect = stage.createEmptyMovieClip("effect",2);
               this.itemdata = new ItemData();
               this.itemwait = [];
               this.itemarr = [];
               this.boxarr = [];
               this.parr = [];
            }[§§constant(62)] = eval("{invalid_utf8=179}e")["{invalid_utf8=224} /{invalid_utf8=205}"][§§constant(4)][§§constant(5)];
            _global.CoinItem = function(stage)
            {
               this.stage = stage.createEmptyMovieClip("item",1);
               this.effect = stage.createEmptyMovieClip("effect",2);
               this.itemdata = new ItemData();
               this.itemwait = [];
               this.itemarr = [];
               this.boxarr = [];
               this.parr = [];
            }[§§constant(63)] = §§constant(64);
            _loc2_[§§constant(30)] = §§constant(65);
            _loc2_[§§constant(31)] = §§constant(66);
            _loc2_[§§constant(37)] = {(§§constant(67)):0,(§§constant(68)):0,(§§constant(69)):0,(§§constant(70)):0,(§§constant(65)):0,(§§constant(66)):0};
            _loc2_[§§constant(8)] = {(§§constant(26)):0,(§§constant(71)):1,(§§constant(36)):2,(§§constant(39)):2,(§§constant(14)):3,(§§constant(47)):2,(§§constant(49)):2,(§§constant(50)):2};
            _global.CoinItem = function(stage)
            {
               this.stage = stage.createEmptyMovieClip("item",1);
               this.effect = stage.createEmptyMovieClip("effect",2);
               this.itemdata = new ItemData();
               this.itemwait = [];
               this.itemarr = [];
               this.boxarr = [];
               this.parr = [];
            }[§§constant(72)] = eval("{invalid_utf8=179}e")["{invalid_utf8=224} /{invalid_utf8=205}"][§§constant(4)][§§constant(5)][§§constant(54)]();
            _global.CoinItem = function(stage)
            {
               this.stage = stage.createEmptyMovieClip("item",1);
               this.effect = stage.createEmptyMovieClip("effect",2);
               this.itemdata = new ItemData();
               this.itemwait = [];
               this.itemarr = [];
               this.boxarr = [];
               this.parr = [];
            }[§§constant(73)] = eval("{invalid_utf8=179}e")[§§constant(55)][§§constant(56)][§§constant(57)];
            §§constant(74)(eval("{invalid_utf8=179}e")["{invalid_utf8=224} /{invalid_utf8=205}"][§§constant(4)][§§constant(5)][§§constant(6)],null,1);
            break;
         }
         if(eval("\x01") == 996)
         {
            set("\x01",eval("\x01") - 462);
            if(§§pop())
            {
               set("\x01",eval("\x01") - 514);
            }
         }
         else if(eval("\x01") == 572)
         {
            set("\x01",eval("\x01") + 68);
         }
         else if(eval("\x01") == 640)
         {
            set("\x01",eval("\x01") + 283);
            §§push(true);
         }
         else
         {
            if(eval("\x01") == 512)
            {
               set("\x01",eval("\x01") + 105);
               break;
            }
            if(eval("\x01") == 437)
            {
               set("\x01",eval("\x01") + 23);
               §§push("\x0f");
               §§push(1);
            }
            else if(eval("\x01") == 460)
            {
               set("\x01",eval("\x01") + 113);
               var §§pop() = §§pop();
            }
            else
            {
               if(eval("\x01") != 578)
               {
                  if(eval("\x01") == 356)
                  {
                     set("\x01",eval("\x01") - 356);
                  }
                  break;
               }
               set("\x01",eval("\x01") + 418);
               §§push(!§§pop());
            }
         }
      }
   }
}
