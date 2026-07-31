var §\x01§ = 585;
var §\x0f§ = 1;
class GlobalTarget
{
   function GlobalTarget()
   {
   }
   static function rootFind(target)
   {
      var _loc2_ = [target];
      var target = null;
      while(target = target._parent)
      {
         _loc2_.push(target);
      }
      return _loc2_;
   }
   static function getxy(target)
   {
      var _loc4_ = GlobalTarget.rootFind(target);
      var _loc2_ = 0;
      var _loc3_ = 0;
      for(var _loc5_ in _loc4_)
      {
         var _loc1_ = _loc4_[_loc5_];
         _loc2_ += _loc1_._x;
         _loc3_ += _loc1_._y;
      }
      return {_x:_loc2_,_y:_loc3_};
   }
   static function getdiv(t1, t2)
   {
      var _loc1_ = GlobalTarget.getxy(t1);
      var _loc2_ = GlobalTarget.getxy(t2);
      var _loc3_ = Math.sqrt(Math.pow(_loc2_._x - _loc1_._x,2) + Math.pow(_loc2_._y - _loc1_._y,2));
      return _loc3_;
   }
   static function getdivxy(t1, t2, s)
   {
      var _loc1_ = GlobalTarget.getxy(t1);
      var _loc2_ = GlobalTarget.getxy(t2);
      return _loc2_[s] - _loc1_[s];
   }
   static function getsec(t1, t2)
   {
      var _loc1_ = GlobalTarget.getxy(t1);
      var _loc2_ = GlobalTarget.getxy(t2);
      return Math.atan2(_loc2_._y - _loc1_._y,_loc2_._x - _loc1_._x);
   }
   static function union(to, o)
   {
      var _loc2_ = 0;
      for(var _loc3_ in o)
      {
         _loc2_ = _loc2_ + 1;
         to[_loc3_] = o[_loc3_];
      }
      return _loc2_;
   }
}
