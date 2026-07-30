function §\x04\x05§()
{
   set("\x03",2461 % 511 * true);
   §§push("\x03");
   if("\x01")
   {
   }
   return eval(§§pop());
}
var §\x01§ = -21 + "\x04\x05"();
var _loc2_;
while(true)
{
   if(eval("\x01") == 396)
   {
      set("\x01",eval("\x01") - 7);
      §§push(true);
   }
   else if(eval("\x01") == 981)
   {
      set("\x01",eval("\x01") - 540);
      §§push(!§§pop());
   }
   else if(eval("\x01") == 389)
   {
      set("\x01",eval("\x01") - 177);
      if(§§pop())
      {
         set("\x01",eval("\x01") + 18);
      }
   }
   else if(eval("\x01") == 991)
   {
      set("\x01",eval("\x01") - 12);
      §§push("\x0f");
      §§push(1);
   }
   else if(eval("\x01") == 108)
   {
      set("\x01",eval("\x01") + 883);
   }
   else if(eval("\x01") == 441)
   {
      set("\x01",eval("\x01") + 262);
      if(§§pop())
      {
         set("\x01",eval("\x01") - 681);
      }
   }
   else
   {
      if(eval("\x01") == 212)
      {
         set("\x01",eval("\x01") + 18);
         §§push(§§pop() >>> (§§pop() >> §§pop()[§§pop()]));
         break;
      }
      if(eval("\x01") == 280)
      {
         set("\x01",eval("\x01") + 701);
         §§push(eval(§§pop()));
      }
      else if(eval("\x01") == 530)
      {
         set("\x01",eval("\x01") - 250);
         §§push("\x0f");
      }
      else if(eval("\x01") == 230)
      {
         set("\x01",eval("\x01") + 761);
      }
      else if(eval("\x01") == 979)
      {
         set("\x01",eval("\x01") - 449);
         var §§pop() = §§pop();
      }
      else
      {
         if(eval("\x01") == 22)
         {
            set("\x01",eval("\x01") + 859);
            if(!_global.mx)
            {
               _global.mx = new Object();
            }
            §§pop();
            if(!_global.mx.controls)
            {
               _global.mx.controls = new Object();
            }
            §§pop();
            if(!_global.mx.controls.SimpleButton)
            {
               mx.controls.SimpleButton extends mx.core.UIComponent;
               _loc2_ = mx.controls.SimpleButton = function()
               {
                  super();
               }.prototype;
               _loc2_.init = function(Void)
               {
                  super.init();
                  if(this.preset == undefined)
                  {
                     this.boundingBox_mc._visible = false;
                     this.boundingBox_mc._width = this.boundingBox_mc._height = 0;
                  }
                  this.useHandCursor = false;
               };
               _loc2_.createChildren = function(Void)
               {
                  var _loc2_;
                  if(this.preset != undefined)
                  {
                     _loc2_ = this[this.idNames[this.preset]];
                     this[this.refNames[this.preset]] = _loc2_;
                     this.skinName = _loc2_;
                     if(this.falseOverSkin.length == 0)
                     {
                        this.rolloverSkin = this.fus;
                     }
                     if(this.falseOverIcon.length == 0)
                     {
                        this.rolloverIcon = this.fui;
                     }
                     this.initializing = false;
                  }
                  else if(this.__state == true)
                  {
                     this.setStateVar(true);
                  }
                  else
                  {
                     if(this.falseOverSkin.length == 0)
                     {
                        this.rolloverSkin = this.fus;
                     }
                     if(this.falseOverIcon.length == 0)
                     {
                        this.rolloverIcon = this.fui;
                     }
                  }
               };
               _loc2_.setIcon = function(tag, linkageName)
               {
                  return this.setSkin(tag + 8,linkageName);
               };
               _loc2_.changeIcon = function(tag, linkageName)
               {
                  this.linkLength = linkageName.length;
                  var _loc2_ = this.stateNames[tag] + "Icon";
                  this[_loc2_] = linkageName;
                  this[this.idNames[tag + 8]] = _loc2_;
                  this.setStateVar(this.getState());
               };
               _loc2_.changeSkin = function(tag, linkageName)
               {
                  var _loc2_ = this.stateNames[tag] + "Skin";
                  this[_loc2_] = linkageName;
                  this[this.idNames[tag]] = _loc2_;
                  this.setStateVar(this.getState());
               };
               _loc2_.viewIcon = function(varName)
               {
                  var _loc4_ = varName + "Icon";
                  var _loc3_ = this[_loc4_];
                  var _loc5_;
                  if(typeof _loc3_ == "string")
                  {
                     _loc5_ = _loc3_;
                     if(this.__emphasized)
                     {
                        if(this[_loc3_ + "Emphasized"].length > 0)
                        {
                           _loc3_ += "Emphasized";
                        }
                     }
                     if(this[_loc3_].length == 0)
                     {
                        return undefined;
                     }
                     _loc3_ = this.setIcon(this.tagMap[_loc5_],this[_loc3_]);
                     if(_loc3_ == undefined && _global.isLivePreview)
                     {
                        _loc3_ = this.setIcon(0,"ButtonIcon");
                     }
                     this[_loc4_] = _loc3_;
                  }
                  this.iconName._visible = false;
                  this.iconName = _loc3_;
                  this.iconName._visible = true;
               };
               _loc2_.removeIcons = function()
               {
                  var _loc3_ = 0;
                  var _loc2_;
                  while(_loc3_ < 2)
                  {
                     _loc2_ = 8;
                     while(_loc2_ < 16)
                     {
                        this.destroyObject(this.idNames[_loc2_]);
                        this[this.stateNames[_loc2_ - 8] + "Icon"] = "";
                        _loc2_ = _loc2_ + 1;
                     }
                     _loc3_ = _loc3_ + 1;
                  }
                  this.refresh();
               };
               _loc2_.setSkin = function(tag, linkageName, initobj)
               {
                  var _loc3_ = super.setSkin(tag,linkageName,initobj == undefined ? {styleName:this} : initobj);
                  this.calcSize(tag,_loc3_);
                  return _loc3_;
               };
               _loc2_.calcSize = function(Void)
               {
                  this.__width = this._width;
                  this.__height = this._height;
               };
               _loc2_.viewSkin = function(varName, initObj)
               {
                  var _loc3_ = varName + "Skin";
                  var _loc2_ = this[_loc3_];
                  var _loc4_;
                  if(typeof _loc2_ == "string")
                  {
                     _loc4_ = _loc2_;
                     if(this.__emphasized)
                     {
                        if(this[_loc2_ + "Emphasized"].length > 0)
                        {
                           _loc2_ += "Emphasized";
                        }
                     }
                     if(this[_loc2_].length == 0)
                     {
                        return undefined;
                     }
                     _loc2_ = this.setSkin(this.tagMap[_loc4_],this[_loc2_],initObj == undefined ? {styleName:this} : initObj);
                     this[_loc3_] = _loc2_;
                  }
                  this.skinName._visible = false;
                  this.skinName = _loc2_;
                  this.skinName._visible = true;
               };
               _loc2_.showEmphasized = function(e)
               {
                  if(e && !this.__emphatic)
                  {
                     if(mx.controls.SimpleButton.emphasizedStyleDeclaration != undefined)
                     {
                        this.__emphaticStyleName = this.styleName;
                        this.styleName = mx.controls.SimpleButton.emphasizedStyleDeclaration;
                     }
                     this.__emphatic = true;
                  }
                  else
                  {
                     if(this.__emphatic)
                     {
                        this.styleName = this.__emphaticStyleName;
                     }
                     this.__emphatic = false;
                  }
               };
               _loc2_.refresh = function(Void)
               {
                  var _loc2_ = this.getState();
                  if(this.enabled == false)
                  {
                     this.viewIcon("disabled");
                     this.viewSkin("disabled");
                  }
                  else
                  {
                     this.viewSkin(this.phase);
                     this.viewIcon(this.phase);
                  }
                  this.setView(this.phase == "down");
                  this.iconName.enabled = this.enabled;
               };
               _loc2_.setView = function(offset)
               {
                  if(this.iconName == undefined)
                  {
                     return undefined;
                  }
                  var _loc2_ = !offset ? 0 : this.btnOffset;
                  this.iconName._x = (this.__width - this.iconName._width) / 2 + _loc2_;
                  this.iconName._y = (this.__height - this.iconName._height) / 2 + _loc2_;
               };
               _loc2_.setStateVar = function(state)
               {
                  if(state)
                  {
                     if(this.trueOverSkin.length == 0)
                     {
                        this.rolloverSkin = this.tus;
                     }
                     else
                     {
                        this.rolloverSkin = this.trs;
                     }
                     if(this.trueOverIcon.length == 0)
                     {
                        this.rolloverIcon = this.tui;
                     }
                     else
                     {
                        this.rolloverIcon = this.tri;
                     }
                     this.upSkin = this.tus;
                     this.downSkin = this.tds;
                     this.disabledSkin = this.dts;
                     this.upIcon = this.tui;
                     this.downIcon = this.tdi;
                     this.disabledIcon = this.dti;
                  }
                  else
                  {
                     if(this.falseOverSkin.length == 0)
                     {
                        this.rolloverSkin = this.fus;
                     }
                     else
                     {
                        this.rolloverSkin = this.frs;
                     }
                     if(this.falseOverIcon.length == 0)
                     {
                        this.rolloverIcon = this.fui;
                     }
                     else
                     {
                        this.rolloverIcon = this.fri;
                     }
                     this.upSkin = this.fus;
                     this.downSkin = this.fds;
                     this.disabledSkin = this.dfs;
                     this.upIcon = this.fui;
                     this.downIcon = this.fdi;
                     this.disabledIcon = this.dfi;
                  }
                  this.__state = state;
               };
               _loc2_.setState = function(state)
               {
                  if(state != this.__state)
                  {
                     this.setStateVar(state);
                     this.invalidate();
                  }
               };
               _loc2_.size = function(Void)
               {
                  this.refresh();
               };
               _loc2_.draw = function(Void)
               {
                  if(this.initializing)
                  {
                     this.initializing = false;
                     this.skinName.visible = true;
                     this.iconName.visible = true;
                  }
                  this.size();
               };
               _loc2_.getState = function(Void)
               {
                  return this.__state;
               };
               _loc2_.setToggle = function(val)
               {
                  this.__toggle = val;
                  if(this.__toggle == false)
                  {
                     this.setState(false);
                  }
               };
               _loc2_.getToggle = function(Void)
               {
                  return this.__toggle;
               };
               _loc2_.__set__toggle = function(val)
               {
                  this.setToggle(val);
                  return this.toggle;
               };
               _loc2_.__get__toggle = function()
               {
                  return this.getToggle();
               };
               _loc2_.__set__value = function(val)
               {
                  this.setSelected(val);
                  return this.value;
               };
               _loc2_.__get__value = function()
               {
                  return this.getSelected();
               };
               _loc2_.__set__selected = function(val)
               {
                  this.setSelected(val);
                  return this.selected;
               };
               _loc2_.__get__selected = function()
               {
                  return this.getSelected();
               };
               _loc2_.setSelected = function(val)
               {
                  if(this.__toggle)
                  {
                     this.setState(val);
                  }
                  else
                  {
                     this.setState(!this.initializing ? this.__state : val);
                  }
               };
               _loc2_.getSelected = function()
               {
                  return this.__state;
               };
               _loc2_.setEnabled = function(val)
               {
                  if(this.enabled != val)
                  {
                     super.setEnabled(val);
                     this.invalidate();
                  }
               };
               _loc2_.onPress = function(Void)
               {
                  this.pressFocus();
                  this.phase = "down";
                  this.refresh();
                  this.dispatchEvent({type:"buttonDown"});
                  if(this.autoRepeat)
                  {
                     this.interval = setInterval(this,"onPressDelay",this.getStyle("repeatDelay"));
                  }
               };
               _loc2_.onPressDelay = function(Void)
               {
                  this.dispatchEvent({type:"buttonDown"});
                  if(this.autoRepeat)
                  {
                     clearInterval(this.interval);
                     this.interval = setInterval(this,"onPressRepeat",this.getStyle("repeatInterval"));
                  }
               };
               _loc2_.onPressRepeat = function(Void)
               {
                  this.dispatchEvent({type:"buttonDown"});
                  updateAfterEvent();
               };
               _loc2_.onRelease = function(Void)
               {
                  this.releaseFocus();
                  this.phase = "rollover";
                  if(this.interval != undefined)
                  {
                     clearInterval(this.interval);
                     delete this.interval;
                  }
                  if(this.getToggle())
                  {
                     this.setState(!this.getState());
                  }
                  else
                  {
                     this.refresh();
                  }
                  this.dispatchEvent({type:"click"});
               };
               _loc2_.onDragOut = function(Void)
               {
                  this.phase = "up";
                  this.refresh();
                  this.dispatchEvent({type:"buttonDragOut"});
               };
               _loc2_.onDragOver = function(Void)
               {
                  if(this.phase != "up")
                  {
                     this.onPress();
                     return undefined;
                  }
                  this.phase = "down";
                  this.refresh();
               };
               _loc2_.onReleaseOutside = function(Void)
               {
                  this.releaseFocus();
                  this.phase = "up";
                  if(this.interval != undefined)
                  {
                     clearInterval(this.interval);
                     delete this.interval;
                  }
               };
               _loc2_.onRollOver = function(Void)
               {
                  this.phase = "rollover";
                  this.refresh();
               };
               _loc2_.onRollOut = function(Void)
               {
                  this.phase = "up";
                  this.refresh();
               };
               _loc2_.getLabel = function(Void)
               {
                  return this.fui.text;
               };
               _loc2_.setLabel = function(val)
               {
                  if(typeof this.fui == "string")
                  {
                     this.createLabel("fui",8,val);
                     this.fui.styleName = this;
                  }
                  else
                  {
                     this.fui.text = val;
                  }
                  var _loc4_ = this.fui._getTextFormat();
                  var _loc2_ = _loc4_.getTextExtent2(val);
                  this.fui._width = _loc2_.width + 5;
                  this.fui._height = _loc2_.height + 5;
                  this.iconName = this.fui;
                  this.setView(this.__state);
               };
               _loc2_.__get__emphasized = function()
               {
                  return this.__emphasized;
               };
               _loc2_.__set__emphasized = function(val)
               {
                  this.__emphasized = val;
                  var _loc2_ = 0;
                  while(_loc2_ < 8)
                  {
                     this[this.idNames[_loc2_]] = this.stateNames[_loc2_] + "Skin";
                     if(typeof this[this.idNames[_loc2_ + 8]] == "movieclip")
                     {
                        this[this.idNames[_loc2_ + 8]] = this.stateNames[_loc2_] + "Icon";
                     }
                     _loc2_ = _loc2_ + 1;
                  }
                  this.showEmphasized(this.__emphasized);
                  this.setStateVar(this.__state);
                  this.invalidateStyle();
                  return this.emphasized;
               };
               _loc2_.keyDown = function(e)
               {
                  if(e.code == 32)
                  {
                     this.onPress();
                  }
               };
               _loc2_.keyUp = function(e)
               {
                  if(e.code == 32)
                  {
                     this.onRelease();
                  }
               };
               _loc2_.onKillFocus = function(newFocus)
               {
                  super.onKillFocus();
                  if(this.phase != "up")
                  {
                     this.phase = "up";
                     this.refresh();
                  }
               };
               mx.controls.SimpleButton = function()
               {
                  super();
               }.symbolName = "SimpleButton";
               mx.controls.SimpleButton = function()
               {
                  super();
               }.symbolOwner = mx.controls.SimpleButton;
               mx.controls.SimpleButton = function()
               {
                  super();
               }.version = "2.0.2.127";
               _loc2_.className = "SimpleButton";
               _loc2_.style3dInset = 4;
               _loc2_.btnOffset = 1;
               _loc2_.__toggle = false;
               _loc2_.__state = false;
               _loc2_.__emphasized = false;
               _loc2_.__emphatic = false;
               mx.controls.SimpleButton = function()
               {
                  super();
               }.falseUp = 0;
               mx.controls.SimpleButton = function()
               {
                  super();
               }.falseDown = 1;
               mx.controls.SimpleButton = function()
               {
                  super();
               }.falseOver = 2;
               mx.controls.SimpleButton = function()
               {
                  super();
               }.falseDisabled = 3;
               mx.controls.SimpleButton = function()
               {
                  super();
               }.trueUp = 4;
               mx.controls.SimpleButton = function()
               {
                  super();
               }.trueDown = 5;
               mx.controls.SimpleButton = function()
               {
                  super();
               }.trueOver = 6;
               mx.controls.SimpleButton = function()
               {
                  super();
               }.trueDisabled = 7;
               _loc2_.falseUpSkin = "SimpleButtonUp";
               _loc2_.falseDownSkin = "SimpleButtonIn";
               _loc2_.falseOverSkin = "";
               _loc2_.falseDisabledSkin = "SimpleButtonUp";
               _loc2_.trueUpSkin = "SimpleButtonIn";
               _loc2_.trueDownSkin = "";
               _loc2_.trueOverSkin = "";
               _loc2_.trueDisabledSkin = "SimpleButtonIn";
               _loc2_.falseUpIcon = "";
               _loc2_.falseDownIcon = "";
               _loc2_.falseOverIcon = "";
               _loc2_.falseDisabledIcon = "";
               _loc2_.trueUpIcon = "";
               _loc2_.trueDownIcon = "";
               _loc2_.trueOverIcon = "";
               _loc2_.trueDisabledIcon = "";
               _loc2_.phase = "up";
               _loc2_.fui = "falseUpIcon";
               _loc2_.fus = "falseUpSkin";
               _loc2_.fdi = "falseDownIcon";
               _loc2_.fds = "falseDownSkin";
               _loc2_.frs = "falseOverSkin";
               _loc2_.fri = "falseOverIcon";
               _loc2_.dfi = "falseDisabledIcon";
               _loc2_.dfs = "falseDisabledSkin";
               _loc2_.tui = "trueUpIcon";
               _loc2_.tus = "trueUpSkin";
               _loc2_.tdi = "trueDownIcon";
               _loc2_.tds = "trueDownSkin";
               _loc2_.trs = "trueOverSkin";
               _loc2_.tri = "trueOverIcon";
               _loc2_.dts = "trueDisabledSkin";
               _loc2_.dti = "trueDisabledIcon";
               _loc2_.rolloverSkin = mx.controls.SimpleButton.prototype.frs;
               _loc2_.rolloverIcon = mx.controls.SimpleButton.prototype.fri;
               _loc2_.upSkin = mx.controls.SimpleButton.prototype.fus;
               _loc2_.downSkin = mx.controls.SimpleButton.prototype.fds;
               _loc2_.disabledSkin = mx.controls.SimpleButton.prototype.dfs;
               _loc2_.upIcon = mx.controls.SimpleButton.prototype.fui;
               _loc2_.downIcon = mx.controls.SimpleButton.prototype.fdi;
               _loc2_.disabledIcon = mx.controls.SimpleButton.prototype.dfi;
               _loc2_.initializing = true;
               _loc2_.idNames = ["fus","fds","frs","dfs","tus","tds","trs","dts","fui","fdi","fri","dfi","tui","tdi","tri","dti"];
               _loc2_.stateNames = ["falseUp","falseDown","falseOver","falseDisabled","trueUp","trueDown","trueOver","trueDisabled"];
               _loc2_.refNames = ["upSkin","downSkin","rolloverSkin","disabledSkin"];
               _loc2_.tagMap = {falseUpSkin:0,falseDownSkin:1,falseOverSkin:2,falseDisabledSkin:3,trueUpSkin:4,trueDownSkin:5,trueOverSkin:6,trueDisabledSkin:7,falseUpIcon:0,falseDownIcon:1,falseOverIcon:2,falseDisabledIcon:3,trueUpIcon:4,trueDownIcon:5,trueOverIcon:6,trueDisabledIcon:7};
               §§push(_loc2_.addProperty("emphasized",_loc2_.__get__emphasized,_loc2_.__set__emphasized));
               §§push(_loc2_.addProperty("selected",_loc2_.__get__selected,_loc2_.__set__selected));
               §§push(_loc2_.addProperty("toggle",_loc2_.__get__toggle,_loc2_.__set__toggle));
               §§push(_loc2_.addProperty("value",_loc2_.__get__value,_loc2_.__set__value));
               §§push(ASSetPropFlags(mx.controls.SimpleButton.prototype,null,1));
            }
            §§pop();
            break;
         }
         if(eval("\x01") != 703)
         {
            if(eval("\x01") == 881)
            {
               set("\x01",eval("\x01") - 881);
            }
            break;
         }
         set("\x01",eval("\x01") - 681);
      }
   }
}
