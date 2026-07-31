var §\x01§ = 356;
var §\x0f§ = 1;
class CoinItem
{
   var stage;
   var effect;
   var itemdata;
   var itemwait;
   var itemarr;
   var boxarr;
   var parr;
   var addPoint;
   var bonusEffect;
   var depth = 1;
   var depthe = 1;
   var pitem = 0;
   var bonus = false;
   function CoinItem(stage)
   {
      this.stage = stage.createEmptyMovieClip("item",1);
      this.effect = stage.createEmptyMovieClip("effect",2);
      this.itemdata = new ItemData();
      this.itemwait = [];
      this.itemarr = [];
      this.boxarr = [];
      this.parr = [];
   }
   function addItem(map, testitem)
   {
      if(this.itemwait.length <= 0)
      {
         var _loc3_ = [];
         if(testitem != undefined)
         {
            _loc3_ = testitem;
         }
         else
         {
            _loc3_ = this.itemdata.getItem(map);
         }
         var _loc2_ = 0;
         while(_loc2_ < _loc3_.length)
         {
            this.itemwait.push(_loc3_[_loc2_]);
            _loc2_ = _loc2_ + 1;
         }
         if(this.pitem < 8)
         {
            this.pitem++;
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
   }
   function createItem(x, y)
   {
      var _loc4_ = [];
      var _loc6_ = [];
      _loc4_ = _loc4_.concat(this.itemwait.shift());
      if(_loc4_.length > 0)
      {
         var _loc5_ = this.stage.createEmptyMovieClip("item" + this.depth,this.depth++);
         _loc5_._x = x;
         _loc5_._y = y;
         var _loc2_ = 0;
         while(_loc2_ < _loc4_.length)
         {
            var _loc3_ = _loc5_.attachMovie("id_item","item_" + _loc2_,_loc2_);
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
   }
   function eatItem(mc)
   {
      var _loc3_ = 0;
      while(_loc3_ < this.itemarr.length)
      {
         var _loc2_ = 0;
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
   }
   function deleteItem(x)
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
   }
   function onBonus()
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
   }
   function getItemNum(item)
   {
      var _loc4_ = 0;
      var _loc2_ = 0;
      while(_loc2_ < item.length)
      {
         var _loc1_ = 0;
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
   }
   function get _itemarr()
   {
      return this.itemarr;
   }
   function set _itemarr(arr)
   {
      this.itemarr = arr;
   }
   function get _boxarr()
   {
      return this.boxarr;
   }
   function set _boxarr(arr)
   {
      this.boxarr = arr;
   }
}
