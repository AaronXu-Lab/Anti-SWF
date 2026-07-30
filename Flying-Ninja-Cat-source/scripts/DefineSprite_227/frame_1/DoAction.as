function md5(s)
{
   return binl2hex(core_md5(str2binl(s),s.length * strsize));
}
function core_md5(x, len)
{
   x[len >> 5] |= (128 << len) % 32;
   x[(len + 64 >>> 9 << 4) + 14] = len;
   var _loc3_ = 1732584193;
   var _loc4_ = -271733879;
   var _loc5_ = -1732584194;
   var _loc6_ = 271733878;
   var _loc7_ = 0;
   var _loc8_;
   var _loc9_;
   var _loc10_;
   var _loc11_;
   while(_loc7_ < x.length)
   {
      _loc8_ = _loc3_;
      _loc9_ = _loc4_;
      _loc10_ = _loc5_;
      _loc11_ = _loc6_;
      _loc3_ = md5_ff(_loc3_,_loc4_,_loc5_,_loc6_,x[_loc7_ + 0],7,-680876936);
      _loc6_ = md5_ff(_loc6_,_loc3_,_loc4_,_loc5_,x[_loc7_ + 1],12,-389564586);
      _loc5_ = md5_ff(_loc5_,_loc6_,_loc3_,_loc4_,x[_loc7_ + 2],17,606105819);
      _loc4_ = md5_ff(_loc4_,_loc5_,_loc6_,_loc3_,x[_loc7_ + 3],22,-1044525330);
      _loc3_ = md5_ff(_loc3_,_loc4_,_loc5_,_loc6_,x[_loc7_ + 4],7,-176418897);
      _loc6_ = md5_ff(_loc6_,_loc3_,_loc4_,_loc5_,x[_loc7_ + 5],12,1200080426);
      _loc5_ = md5_ff(_loc5_,_loc6_,_loc3_,_loc4_,x[_loc7_ + 6],17,-1473231341);
      _loc4_ = md5_ff(_loc4_,_loc5_,_loc6_,_loc3_,x[_loc7_ + 7],22,-45705983);
      _loc3_ = md5_ff(_loc3_,_loc4_,_loc5_,_loc6_,x[_loc7_ + 8],7,1770035416);
      _loc6_ = md5_ff(_loc6_,_loc3_,_loc4_,_loc5_,x[_loc7_ + 9],12,-1958414417);
      _loc5_ = md5_ff(_loc5_,_loc6_,_loc3_,_loc4_,x[_loc7_ + 10],17,-42063);
      _loc4_ = md5_ff(_loc4_,_loc5_,_loc6_,_loc3_,x[_loc7_ + 11],22,-1990404162);
      _loc3_ = md5_ff(_loc3_,_loc4_,_loc5_,_loc6_,x[_loc7_ + 12],7,1804603682);
      _loc6_ = md5_ff(_loc6_,_loc3_,_loc4_,_loc5_,x[_loc7_ + 13],12,-40341101);
      _loc5_ = md5_ff(_loc5_,_loc6_,_loc3_,_loc4_,x[_loc7_ + 14],17,-1502002290);
      _loc4_ = md5_ff(_loc4_,_loc5_,_loc6_,_loc3_,x[_loc7_ + 15],22,1236535329);
      _loc3_ = md5_gg(_loc3_,_loc4_,_loc5_,_loc6_,x[_loc7_ + 1],5,-165796510);
      _loc6_ = md5_gg(_loc6_,_loc3_,_loc4_,_loc5_,x[_loc7_ + 6],9,-1069501632);
      _loc5_ = md5_gg(_loc5_,_loc6_,_loc3_,_loc4_,x[_loc7_ + 11],14,643717713);
      _loc4_ = md5_gg(_loc4_,_loc5_,_loc6_,_loc3_,x[_loc7_ + 0],20,-373897302);
      _loc3_ = md5_gg(_loc3_,_loc4_,_loc5_,_loc6_,x[_loc7_ + 5],5,-701558691);
      _loc6_ = md5_gg(_loc6_,_loc3_,_loc4_,_loc5_,x[_loc7_ + 10],9,38016083);
      _loc5_ = md5_gg(_loc5_,_loc6_,_loc3_,_loc4_,x[_loc7_ + 15],14,-660478335);
      _loc4_ = md5_gg(_loc4_,_loc5_,_loc6_,_loc3_,x[_loc7_ + 4],20,-405537848);
      _loc3_ = md5_gg(_loc3_,_loc4_,_loc5_,_loc6_,x[_loc7_ + 9],5,568446438);
      _loc6_ = md5_gg(_loc6_,_loc3_,_loc4_,_loc5_,x[_loc7_ + 14],9,-1019803690);
      _loc5_ = md5_gg(_loc5_,_loc6_,_loc3_,_loc4_,x[_loc7_ + 3],14,-187363961);
      _loc4_ = md5_gg(_loc4_,_loc5_,_loc6_,_loc3_,x[_loc7_ + 8],20,1163531501);
      _loc3_ = md5_gg(_loc3_,_loc4_,_loc5_,_loc6_,x[_loc7_ + 13],5,-1444681467);
      _loc6_ = md5_gg(_loc6_,_loc3_,_loc4_,_loc5_,x[_loc7_ + 2],9,-51403784);
      _loc5_ = md5_gg(_loc5_,_loc6_,_loc3_,_loc4_,x[_loc7_ + 7],14,1735328473);
      _loc4_ = md5_gg(_loc4_,_loc5_,_loc6_,_loc3_,x[_loc7_ + 12],20,-1926607734);
      _loc3_ = md5_hh(_loc3_,_loc4_,_loc5_,_loc6_,x[_loc7_ + 5],4,-378558);
      _loc6_ = md5_hh(_loc6_,_loc3_,_loc4_,_loc5_,x[_loc7_ + 8],11,-2022574463);
      _loc5_ = md5_hh(_loc5_,_loc6_,_loc3_,_loc4_,x[_loc7_ + 11],16,1839030562);
      _loc4_ = md5_hh(_loc4_,_loc5_,_loc6_,_loc3_,x[_loc7_ + 14],23,-35309556);
      _loc3_ = md5_hh(_loc3_,_loc4_,_loc5_,_loc6_,x[_loc7_ + 1],4,-1530992060);
      _loc6_ = md5_hh(_loc6_,_loc3_,_loc4_,_loc5_,x[_loc7_ + 4],11,1272893353);
      _loc5_ = md5_hh(_loc5_,_loc6_,_loc3_,_loc4_,x[_loc7_ + 7],16,-155497632);
      _loc4_ = md5_hh(_loc4_,_loc5_,_loc6_,_loc3_,x[_loc7_ + 10],23,-1094730640);
      _loc3_ = md5_hh(_loc3_,_loc4_,_loc5_,_loc6_,x[_loc7_ + 13],4,681279174);
      _loc6_ = md5_hh(_loc6_,_loc3_,_loc4_,_loc5_,x[_loc7_ + 0],11,-358537222);
      _loc5_ = md5_hh(_loc5_,_loc6_,_loc3_,_loc4_,x[_loc7_ + 3],16,-722521979);
      _loc4_ = md5_hh(_loc4_,_loc5_,_loc6_,_loc3_,x[_loc7_ + 6],23,76029189);
      _loc3_ = md5_hh(_loc3_,_loc4_,_loc5_,_loc6_,x[_loc7_ + 9],4,-640364487);
      _loc6_ = md5_hh(_loc6_,_loc3_,_loc4_,_loc5_,x[_loc7_ + 12],11,-421815835);
      _loc5_ = md5_hh(_loc5_,_loc6_,_loc3_,_loc4_,x[_loc7_ + 15],16,530742520);
      _loc4_ = md5_hh(_loc4_,_loc5_,_loc6_,_loc3_,x[_loc7_ + 2],23,-995338651);
      _loc3_ = md5_ii(_loc3_,_loc4_,_loc5_,_loc6_,x[_loc7_ + 0],6,-198630844);
      _loc6_ = md5_ii(_loc6_,_loc3_,_loc4_,_loc5_,x[_loc7_ + 7],10,1126891415);
      _loc5_ = md5_ii(_loc5_,_loc6_,_loc3_,_loc4_,x[_loc7_ + 14],15,-1416354905);
      _loc4_ = md5_ii(_loc4_,_loc5_,_loc6_,_loc3_,x[_loc7_ + 5],21,-57434055);
      _loc3_ = md5_ii(_loc3_,_loc4_,_loc5_,_loc6_,x[_loc7_ + 12],6,1700485571);
      _loc6_ = md5_ii(_loc6_,_loc3_,_loc4_,_loc5_,x[_loc7_ + 3],10,-1894986606);
      _loc5_ = md5_ii(_loc5_,_loc6_,_loc3_,_loc4_,x[_loc7_ + 10],15,-1051523);
      _loc4_ = md5_ii(_loc4_,_loc5_,_loc6_,_loc3_,x[_loc7_ + 1],21,-2054922799);
      _loc3_ = md5_ii(_loc3_,_loc4_,_loc5_,_loc6_,x[_loc7_ + 8],6,1873313359);
      _loc6_ = md5_ii(_loc6_,_loc3_,_loc4_,_loc5_,x[_loc7_ + 15],10,-30611744);
      _loc5_ = md5_ii(_loc5_,_loc6_,_loc3_,_loc4_,x[_loc7_ + 6],15,-1560198380);
      _loc4_ = md5_ii(_loc4_,_loc5_,_loc6_,_loc3_,x[_loc7_ + 13],21,1309151649);
      _loc3_ = md5_ii(_loc3_,_loc4_,_loc5_,_loc6_,x[_loc7_ + 4],6,-145523070);
      _loc6_ = md5_ii(_loc6_,_loc3_,_loc4_,_loc5_,x[_loc7_ + 11],10,-1120210379);
      _loc5_ = md5_ii(_loc5_,_loc6_,_loc3_,_loc4_,x[_loc7_ + 2],15,718787259);
      _loc4_ = md5_ii(_loc4_,_loc5_,_loc6_,_loc3_,x[_loc7_ + 9],21,-343485551);
      _loc3_ = safe_add(_loc3_,_loc8_);
      _loc4_ = safe_add(_loc4_,_loc9_);
      _loc5_ = safe_add(_loc5_,_loc10_);
      _loc6_ = safe_add(_loc6_,_loc11_);
      _loc7_ += 16;
   }
   return Array(_loc3_,_loc4_,_loc5_,_loc6_);
}
function md5_cmn(q, a, b, x, s, t)
{
   return safe_add(bit_rol(safe_add(safe_add(a,q),safe_add(x,t)),s),b);
}
function md5_ff(a, b, c, d, x, s, t)
{
   return md5_cmn(b & c | (~b) & d,a,b,x,s,t);
}
function md5_gg(a, b, c, d, x, s, t)
{
   return md5_cmn(b & d | c & (~d),a,b,x,s,t);
}
function md5_hh(a, b, c, d, x, s, t)
{
   return md5_cmn(b ^ c ^ d,a,b,x,s,t);
}
function md5_ii(a, b, c, d, x, s, t)
{
   return md5_cmn(c ^ (b | ~d),a,b,x,s,t);
}
function safe_add(x, y)
{
   var _loc3_ = (x & 0xFFFF) + (y & 0xFFFF);
   var _loc4_ = (x >> 16) + (y >> 16) + (_loc3_ >> 16);
   return _loc4_ << 16 | _loc3_ & 0xFFFF;
}
function bit_rol(num, cnt)
{
   return num << cnt | num >>> 32 - cnt;
}
function str2binl(str)
{
   var _loc2_ = Array();
   var _loc3_ = (1 << strsize) - 1;
   var _loc4_ = 0;
   while(_loc4_ < str.length * strsize)
   {
      _loc2_[_loc4_ >> 5] |= ((str.charCodeAt(_loc4_ / strsize) & _loc3_) << _loc4_) % 32;
      _loc4_ += strsize;
   }
   return _loc2_;
}
function binl2hex(binarray)
{
   if(!hexcase)
   {
   }
   var _loc2_ = "0123456789abcdef";
   var _loc3_ = "";
   var _loc4_ = 0;
   while(_loc4_ < binarray.length * 4)
   {
      _loc3_ += _loc2_.charAt((binarray[_loc4_ >> 2] >> _loc4_) % (4 * 8 + 4) & 0x0F) + _loc2_.charAt((binarray[_loc4_ >> 2] >> _loc4_) % (4 * 8) & 0x0F);
      _loc4_ += 1;
   }
   return _loc3_;
}
function submit()
{
   if(submited == false && submiting == false)
   {
      submitLv = new LoadVars();
      submitLv.point = score;
      submitLv.PublicKey = "game.yuyangzhou.name";
      submitLv.sign = md5("point=" + submitLv.point + "&c=www.yuyangzhou.name&k=123456");
      submitLv.sendAndLoad(rankURL,result_submitLv,"POST");
      submiting = true;
   }
}
var submiting = false;
var submited = false;
var strsize = 8;
var submitLv;
var result_submitLv = new LoadVars();
var scoreStr;
var gameId;
var score;
var rankURL = "/Flying-Ninja-Cat/Scores.aspx";
var originURL = "http://flash.game.yuyangzhou.name/Flying-Ninja-Cat/";
var init = function()
{
   score = _root.game.score._num;
   scoreTxt.text = score;
   var _loc3_ = md5("point=" + score + "&k=" + key_sina);
   var _loc4_ = "sign=" + _loc3_ + "&gmId=" + gameId + "&point=" + score;
   flash.external.ExternalInterface.call("prepareGameSubmit",_loc4_);
   delete this.onEnterFrame;
};
Security.allowDomain("*");
Security.loadPolicyFile("http://flash.game.yuyangzhou.name/crossdomain.xml");
submited = false;
this.onEnterFrame = function()
{
   init();
};
result_submitLv.onLoad = function(success)
{
   if(score <= 0)
   {
      errorTxt.text = "分数大于0才可以提交成绩";
      return undefined;
   }
   submiting = false;
   errorTxt.text = "正在提交...";
   var _loc2_;
   var _loc3_;
   if(success)
   {
      trace(unescape(result_submitLv.toString()));
      switch(Number(result_submitLv.rtn))
      {
         case 0:
            submitSuccess._visible = true;
            errorTxt.text = "提交成功!";
            submited = true;
            break;
         case 1:
            errorTxt.text = "没有登录无法提交成绩";
            submitFail._visible = true;
            break;
         case 2:
            errorTxt.text = "成绩出错！";
            submitFail._visible = true;
            break;
         case 3:
            errorTxt.text = "游戏出错啦！";
            submitFail._visible = true;
            break;
         case 4:
            errorTxt.text = "提交成绩时出现错误！";
            submitFail._visible = true;
            break;
         case 5:
            errorTxt.text = "异常的错误！";
            submitFail._visible = true;
            break;
         default:
            errorTxt.text = "非法请求！正在打开官方网页。";
            submitFail._visible = true;
            getURL(originURL,"_blank");
      }
      _loc2_ = result_submitLv["function"];
      _loc3_ = result_submitLv.param.split("|");
      if(_loc2_ && _loc2_ != "")
      {
         flash.external.ExternalInterface.call(_loc2_,_loc3_);
      }
   }
   else
   {
      trace("cant\'t connect server!");
      errorTxt.text = "无法连接服务器！";
      submitFail._visible = true;
   }
};
btn_submit.onRelease = function()
{
   submit();
};
btn_again.onRelease = function()
{
   if(againFunction)
   {
      againFunction();
   }
   else
   {
      _root.game.reStart();
   }
};
btn_rank.onRelease = function()
{
   getURL(rankURL,"_self");
};
