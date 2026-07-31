function check(dm)
{
   var _loc3_ = false;
   for(var _loc4_ in dm)
   {
      if(_root._url.indexOf(dm[_loc4_]) == 0)
      {
         _loc3_ = true;
         break;
      }
   }
   if(!_loc3_)
   {
      _root.unloadMovie();
      getURL(toURL,"");
   }
}
var §\x01§ = 354;
var §\x0f§ = 1;
if(enabled)
{
   check(domains);
   this._visible = false;
   stop();
}
else
{
   this.gotoAndStop(2);
}
