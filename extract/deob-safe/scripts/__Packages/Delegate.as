var §\x01§ = 751;
var §\x0f§ = 1;
class Delegate extends Object
{
   var func;
   function Delegate(fun)
   {
      super();
      this.func = fun;
   }
   static function create(obj, func)
   {
      var _loc2_ = function()
      {
         var _loc4_ = arguments.callee.target;
         var _loc3_ = arguments.callee.func;
         var _loc2_ = arguments.callee.args;
         return _loc3_.apply(_loc4_,_loc2_.concat(arguments));
      };
      _loc2_.target = arguments.shift();
      _loc2_.func = arguments.shift();
      _loc2_.args = arguments;
      return _loc2_;
   }
   function createDelegate(obj)
   {
      return Delegate.create(obj,this.func);
   }
}
