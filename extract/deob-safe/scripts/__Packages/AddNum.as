var §\x01§ = 642;
var §\x0f§ = 1;
class AddNum
{
   var scope;
   var mc_name;
   var length;
   var num;
   var xpos;
   var digit;
   var left;
   function AddNum(scope, mc_name, length)
   {
      this.scope = scope;
      this.mc_name = mc_name;
      this.length = length;
      this.num = 0;
      this.xpos = [];
      this.digit = false;
      this.left = false;
      this.Update();
   }
   function Add(num)
   {
      if(this.num + num >= 0)
      {
         this.num += num;
      }
      else
      {
         this.num = 0;
      }
      this.Update();
   }
   function Update()
   {
      this.resetDisit();
      var _loc5_ = this.num.toString();
      var _loc6_ = 0;
      if(this.length > 1)
      {
         var _loc2_ = 0;
         while(_loc2_ < this.length)
         {
            var _loc3_ = undefined;
            var _loc4_ = 10;
            if(this.left)
            {
               if(_loc2_ < _loc5_.length)
               {
                  _loc3_ = Number(_loc5_.charAt(_loc2_));
                  if(_loc3_ > 0)
                  {
                     _loc4_ = _loc3_;
                  }
                  this.scope[this.mc_name + _loc2_].gotoAndStop(_loc4_);
               }
               else
               {
                  this.scope[this.mc_name + _loc2_].gotoAndStop(10);
               }
            }
            else if(_loc2_ >= this.length - _loc5_.length)
            {
               _loc3_ = Number(_loc5_.charAt(_loc2_ - _loc6_));
               if(_loc3_ > 0)
               {
                  _loc4_ = _loc3_;
               }
               this.scope[this.mc_name + _loc2_].gotoAndStop(_loc4_);
            }
            else
            {
               _loc6_ = _loc6_ + 1;
               this.scope[this.mc_name + _loc2_].gotoAndStop(10);
            }
            _loc2_ = _loc2_ + 1;
         }
      }
      else
      {
         this.scope[this.mc_name + 0].gotoAndStop(this.num);
      }
   }
   function resetDisit()
   {
      if(this.digit)
      {
         var _loc2_ = 0;
         while(_loc2_ < this.length)
         {
            this.scope[this.mc_name + _loc2_]._visible = false;
            _loc2_ = _loc2_ + 1;
         }
         var _loc3_ = Number(String(this.num).length);
         if(this.left)
         {
            _loc2_ = 0;
            while(_loc2_ < _loc3_)
            {
               this.scope[this.mc_name + _loc2_]._visible = true;
               _loc2_ = _loc2_ + 1;
            }
         }
         else
         {
            _loc2_ = 0;
            while(_loc2_ < _loc3_)
            {
               this.scope[this.mc_name + (this.length - _loc2_ - 1)]._visible = true;
               _loc2_ = _loc2_ + 1;
            }
         }
      }
      else
      {
         _loc2_ = 0;
         while(_loc2_ < this.length)
         {
            this.scope[this.mc_name + _loc2_]._visible = true;
            _loc2_ = _loc2_ + 1;
         }
      }
   }
   function set _num(num)
   {
      if(this.num >= 0)
      {
         this.num = num;
      }
      else
      {
         this.num = 0;
      }
      this.Update();
      null;
   }
   function get _num()
   {
      return this.num;
   }
   function set _digit(bool)
   {
      this.digit = bool;
      this.Update();
      null;
   }
   function set _left(bool)
   {
      this.left = bool;
      this.Update();
      null;
   }
}
