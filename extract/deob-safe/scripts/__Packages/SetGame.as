var §\x01§ = 645;
var §\x0f§ = 1;
class SetGame
{
   var scope;
   var sound;
   var mouse;
   var stage;
   var rstage;
   var rope;
   var stick;
   var itemstage;
   var coinitem;
   var gstage;
   var gogoon;
   var effect;
   var uistage;
   var score;
   var ui_run;
   var catstone;
   var best;
   var effect_mc;
   var effect_mc2;
   var bitmapdata;
   var bitmapdata2;
   var map;
   var blockarr;
   var item;
   var testmap;
   var testitem;
   var mapdata;
   var facetime;
   var obj;
   var userids;
   var scores;
   var effectarr = [];
   var way = 0;
   var nextway = 0;
   var count = 0;
   var record = false;
   var spacebar = false;
   var test_map = false;
   var test_item = false;
   var testnum = 0;
   var click = false;
   var status = "run";
   var depth = 100;
   var speed = 15;
   var addspeed = 1;
   var level = 0;
   var block_w = 150;
   var dy = 30;
   var gravity = 3.5;
   var ground = 365;
   var ropespeed = 40;
   var maxcount = [50,100,150,200,250,300,1000];
   function SetGame(scope)
   {
      this.scope = scope;
      this.onServerSend("gamestart");
      this.initialize();
   }
   function initialize()
   {
      this.sound = this.scope.sound;
      this.sound.stop("snd_titlebg");
      this.sound.play("snd_gamebg",9999);
      this.mouse = new MouseListener();
      this.mouse.onMouseDown = Delegate.create(this,this.onMouseDown);
      this.mouse.onMouseUp = Delegate.create(this,this.onMouseUp);
      this.mouse._use = true;
      if(GameMode.mode == "2x")
      {
         this.addspeed = 1.5;
      }
      this.setMovieClip();
      this.initMap();
      this.scope.editor.prevmap.text = "";
      this.scope.editor.nextmap.text = "";
   }
   function setMovieClip()
   {
      this.stage = this.scope.createEmptyMovieClip("stage",1);
      this.stage.scrollRect = new flash.geom.Rectangle(0,0,640,480);
      this.rstage = this.scope.createEmptyMovieClip("rstage",2);
      this.rope = this.rstage.createEmptyMovieClip("rope",1);
      this.stick = this.rstage.attachMovie("id_stick","stick_mc",2);
      this.stick._visible = false;
      this.itemstage = this.scope.createEmptyMovieClip("item",3);
      this.itemstage.scrollRect = new flash.geom.Rectangle(0,0,640,480);
      this.coinitem = new CoinItem(this.itemstage);
      this.coinitem.addPoint = Delegate.create(this,this.addPoint);
      this.coinitem.bonusEffect = Delegate.create(this,this.onEffect,"bonus");
      this.gstage = this.scope.createEmptyMovieClip("gogoon",4);
      this.gogoon = this.gstage.attachMovie("id_gogoon","gogoon_mc",4,{_x:200,_y:this.ground});
      this.effect = this.scope.createEmptyMovieClip("effect",5);
      this.uistage = this.scope.createEmptyMovieClip("ui",6);
      this.uistage.attachMovie("id_score","score",1,{_x:11,_y:8});
      this.score = new AddNum(this.uistage.score,"score",6);
      this.score._digit = true;
      this.score._left = true;
      this.ui_run = this.uistage.attachMovie("id_running","running",2,{_x:50,_y:463});
      this.catstone = this.scope.catstone_mc;
      this.best = new AddNum(this.catstone,"score",7);
      if(this.scope.bestscore > 0)
      {
         this.best._num = this.scope.bestscore;
      }
      else
      {
         this.best._num = 0;
      }
      this.effect_mc = this.gstage.createEmptyMovieClip("shadow1",2);
      this.effect_mc2 = this.gstage.createEmptyMovieClip("shadow2",1);
      this.bitmapdata = new flash.display.BitmapData(200,200,true,0);
      this.effect_mc.attachBitmap(this.bitmapdata,1);
      this.effect_mc._alpha = 50;
      this.bitmapdata2 = new flash.display.BitmapData(200,200,true,0);
      this.effect_mc2.attachBitmap(this.bitmapdata2,0);
      this.effect_mc2._alpha = 20;
      this.scope.cloude_mc.cacheAsBitmap = true;
   }
   function onMouseDown()
   {
      this.click = true;
      if(this.status == "run")
      {
         this.gJump();
      }
      else if(this.status == "jump")
      {
         this.gShoot();
      }
   }
   function onMouseUp()
   {
      this.click = false;
   }
   function onKeyDown()
   {
      if(Key.isDown(32) && !this.spacebar)
      {
         this.spacebar = true;
         this.onMouseDown();
      }
   }
   function onKeyUp()
   {
      this.spacebar = false;
      this.onMouseUp();
   }
   function onStart()
   {
      this.gRun();
      this.stage.onEnterFrame = Delegate.create(this,this.onEnterFrame);
   }
   function initMap()
   {
      this.map = [];
      this.blockarr = [];
      this.item = [];
      this.testmap = [];
      this.testitem = [];
      this.mapdata = new MapData();
      var _loc2_ = 0;
      while(_loc2_ < 6)
      {
         this.createBlock(2,_loc2_ * this.block_w);
         _loc2_ = _loc2_ + 1;
      }
      this.count = 0;
   }
   function gRun()
   {
      this.status = "run";
      this.click = false;
      this.gogoon.gotoAndStop("run");
      this.gogoon.onEnterFrame = Delegate.create(this,this.gRun_EnterFrame);
      this.sound.play("snd_run",999);
   }
   function gRun_EnterFrame()
   {
      if(!this.groundCheck())
      {
         this.gameOver();
      }
   }
   function gJump()
   {
      this.status = "jump";
      this.gogoon.gotoAndStop("jump");
      this.sound.stop("snd_run");
      this.sound.play("snd_ropeup");
      this.gogoon.dy = this.dy * this.addspeed;
      this.gogoon.onEnterFrame = Delegate.create(this,this.gJump_EnterFrame,this.gravity);
   }
   function gJump_EnterFrame(gravity)
   {
      if(this.gogoon.dy > -20)
      {
         this.gogoon.dy -= gravity * Math.pow(this.addspeed,2);
      }
      this.gogoon._y -= this.gogoon.dy;
      if(this.gogoon.dy < 0)
      {
         if(this.status != "shoot")
         {
            this.status = "jump";
         }
         if(this.gogoon._y >= this.ground && this.groundCheck())
         {
            this.gogoon._y = this.ground;
            this.rope.clear();
            this.stick._visible = false;
            delete this.rope.onEnterFrame;
            delete this.gogoon.onEnterFrame;
            this.gRun();
            this.sound.stop("snd_spin");
         }
         if(this.dieCheck(470))
         {
            this.gameOver();
         }
      }
   }
   function gShoot()
   {
      this.status = "shoot";
      this.gogoon.gotoAndStop("shoot");
      this.sound.stop("snd_spin");
      this.sound.play("snd_shoot");
      this.rope.tx = GlobalTarget.getxy(this.gogoon.ropepos)._x;
      this.rope.ty = GlobalTarget.getxy(this.gogoon.ropepos)._y;
      this.stick._visible = true;
      this.rope.onEnterFrame = Delegate.create(this,this.gShoot_EnterFrame);
   }
   function gShoot_EnterFrame()
   {
      if(this.rope.ty > 0)
      {
         this.drawLine(this.rope.tx += this.ropespeed + 5,this.rope.ty -= this.ropespeed - 5);
         this.rope.arrow._x += this.ropespeed;
         this.rope.arrow._y -= this.ropespeed;
         this.stick._x = this.rope.tx;
         this.stick._y = this.rope.ty;
         var _loc2_ = {_x:this.rope.tx,_y:this.rope.ty};
         this.stick._rotation = GlobalTarget.getsec(GlobalTarget.getxy(this.gogoon.ropepos),_loc2_) * 57.29578;
         if(this.checkRope())
         {
            this.gRope();
         }
      }
      else
      {
         this.rope.clear();
         this.stick._visible = false;
         delete this.rope.onEnterFrame;
         this.status = "jump";
      }
   }
   function drawLine(tx, ty)
   {
      this.rope.clear();
      this.rope.lineStyle(1,9878196,100);
      this.rope.moveTo(GlobalTarget.getxy(this.gogoon.ropepos)._x,GlobalTarget.getxy(this.gogoon.ropepos)._y);
      this.rope.lineTo(tx,ty);
   }
   function checkRope()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.blockarr.length)
      {
         if(this.blockarr[_loc2_].rope_pos.hitTest(this.rope.tx,this.rope.ty,false))
         {
            return true;
         }
         _loc2_ = _loc2_ + 1;
      }
      return false;
   }
   function gRope()
   {
      delete this.gogoon.onEnterFrame;
      this.gogoon.gotoAndStop("rope");
      this.status = "rope";
      this.sound.play("snd_ropecatch");
      this.gogoon.dy = 15 * this.addspeed;
      if(this.rope.ty < 125)
      {
         this.rope.tx -= 125 - this.rope.ty - 5;
      }
      this.rope.ty = 125;
      this.stick._rotation = -80;
      this.stick.gotoAndStop(2);
      this.rope.onEnterFrame = Delegate.create(this,this.gRope_EnterFrame);
   }
   function gRope_EnterFrame()
   {
      if(!this.dieCheck(550))
      {
         this.drawLine(this.rope.tx -= this.speed * this.addspeed,this.rope.ty);
         this.stick._y = this.rope.ty;
         this.stick._x = this.rope.tx;
         var _loc2_ = {_x:this.rope.tx,_y:this.rope.ty};
         this.gogoon.body._rotation = GlobalTarget.getsec(this.gogoon.body,_loc2_) * 57.29578 + 70;
         if(this.click)
         {
            if(this.gogoon.dy > -30)
            {
               this.gogoon.dy -= this.gravity * Math.pow(this.addspeed,2);
            }
            if(this.gogoon._y < this.rope.ty + 50)
            {
               this.gSpin();
            }
         }
         else if(this.gogoon.dy < 30)
         {
            this.gogoon.dy += this.gravity * Math.pow(this.addspeed,2);
         }
         this.gogoon._y += this.gogoon.dy;
         if(this.gogoon.body._rotation < -70)
         {
            this.gSpin();
         }
         if(this.rope.tx < 70)
         {
            this.gSpin();
         }
      }
      else
      {
         this.gameOver();
      }
   }
   function gSpin()
   {
      delete this.rope.onEnterFrame;
      this.rope.clear();
      this.stick._visible = false;
      this.status = "spin";
      this.gogoon.gotoAndStop("spin");
      this.sound.play("snd_spin",999);
      this.gogoon.dy = this.dy + 15 * this.addspeed;
      this.gogoon.onEnterFrame = Delegate.create(this,this.gJump_EnterFrame,this.gravity * 1.5);
   }
   function createBlock(type, x)
   {
      if(type == 4)
      {
         this.goFinish();
      }
      var _loc2_ = this.stage.attachMovie("id_block","block_" + this.depth,this.depth++);
      _loc2_.cacheAsBitmap = true;
      _loc2_.gotoAndStop(type);
      this.blockarr.push(_loc2_);
      _loc2_._x = x;
      _loc2_._y = 520;
      _loc2_.type = type;
      if(!this.test_map)
      {
         this.count++;
         if(this.count >= this.maxcount[this.level])
         {
            this.levelUp();
         }
      }
   }
   function levelUp()
   {
      if(!this.test_map)
      {
         this.level++;
         if(this.level <= 5)
         {
            this.count = 0;
            if(this.level < 3)
            {
               this.speed += 3;
            }
            else
            {
               this.speed += 2;
            }
            this.onEffect("speedup");
         }
         else
         {
            this.count = 0;
            this.map.push(2,2,2,2,2,2,2,2,2,2,4,2,2,2,2,2,2);
         }
      }
   }
   function goFinish()
   {
      this.bitmapdata.dispose();
      this.bitmapdata2.dispose();
      delete this.stage.onEnterFrame;
      this.speed = 0;
      this.mouse._use = false;
      var _loc2_ = this;
      this.stage.onEnterFrame = Delegate.create(this,this.onFinish);
      this.onFade("ending");
   }
   function onFinish()
   {
      this.gogoon._x += 30;
      if(this.scope._currentframe == 60)
      {
         delete this.stage.onEnterFrame;
         this.onDestroy();
         var _loc2_ = new OneTime();
         _loc2_._time = 10;
         _loc2_.onPlay = Delegate.create(this,this.onServerSend,"viewrank");
         _loc2_.onStart();
      }
   }
   function onFade(frame)
   {
      var _loc2_ = this.scope.attachMovie("id_fadeinout","fadeinout",10);
      _loc2_.frame = frame;
      this.sound.play("snd_fadeinout");
   }
   function onEnterFrame()
   {
      this.way += this.speed * this.addspeed;
      this.nextway += this.speed * this.addspeed;
      var _loc2_ = 0;
      while(_loc2_ < this.blockarr.length)
      {
         this.blockarr[_loc2_]._x -= this.speed * this.addspeed;
         _loc2_ = _loc2_ + 1;
      }
      _loc2_ = 0;
      while(_loc2_ < this.coinitem._boxarr.length)
      {
         this.coinitem._boxarr[_loc2_]._x = this.coinitem._boxarr[_loc2_]._x - this.speed * this.addspeed;
         _loc2_ = _loc2_ + 1;
      }
      var _loc4_ = this.block_w * 5 - (this.nextway - this.block_w);
      if(this.block_w <= this.nextway)
      {
         if(this.map.length <= 0)
         {
            var _loc3_ = [];
            if(this.test_map)
            {
               _loc3_ = this.testmap[random(this.testmap.length)];
            }
            else
            {
               _loc3_ = this.mapdata.getMap(this.level);
            }
            this.map = this.map.concat(_loc3_);
            if(this.test_item)
            {
               this.coinitem.addItem(this.map,this.testitem);
            }
            else
            {
               this.coinitem.addItem(this.map);
            }
            this.scope.editor.prevmap.text = this.scope.editor.nextmap.text;
            this.scope.editor.nextmap.text = this.map;
         }
         var _loc5_ = Number(this.map.shift());
         this.createBlock(_loc5_,_loc4_);
         this.coinitem.createItem(_loc4_,520);
         this.coinitem.deleteItem(- this.block_w);
         this.deleteBlock();
         this.nextway -= this.block_w;
      }
      this.coinitem.eatItem(this.gogoon.body.item_pos);
      this.shadowEffect();
      this.updateUI();
      this.scope.cloude_mc._x -= this.speed * this.addspeed / 4;
      if(this.scope.cloude_mc._x < -832)
      {
         this.scope.cloude_mc._x = 832 + this.scope.cloude_mc._x;
      }
   }
   function updateUI()
   {
      this.ui_run.face_mc._x = this.count / this.maxcount[this.level] * 90 + 90 * this.level;
      if(this.best._num < this.score._num)
      {
         if(this.scope.bestscore > 0)
         {
            if(!this.record)
            {
               this.onEffect("best");
            }
            this.record = true;
            this.scope.bestscore = this.best._num = this.score._num;
         }
      }
   }
   function changeFace()
   {
      this.facetime.onStop();
      this.catstone.head_mc.gotoAndStop("suprise");
      this.facetime = new OneTime(5);
      var owner = this;
      this.facetime.onPlay = function()
      {
         owner.catstone.head_mc.gotoAndStop("sleep");
      };
   }
   function shadowEffect()
   {
      this.effectarr.push([this.gogoon._x,this.gogoon._y]);
      if(this.effectarr.length > 3)
      {
         this.effectarr.shift();
      }
      if(this.effectarr.length > 0)
      {
         this.bitmapdata.fillRect(new flash.geom.Rectangle(0,0,200,200),0);
         if(this.effectarr.length > 1)
         {
            this.effect_mc._x = this.effectarr[1][0] - 100;
            this.effect_mc._y = this.effectarr[1][1] - 100;
            var _loc2_ = new flash.geom.Matrix();
            _loc2_.translate(100,100);
            this.bitmapdata.draw(this.gogoon,_loc2_);
         }
         this.bitmapdata2.fillRect(new flash.geom.Rectangle(0,0,200,200),0);
         if(this.effectarr.length > 0)
         {
            this.effect_mc2._x = this.effectarr[0][0] - 100;
            this.effect_mc2._y = this.effectarr[0][1] - 100;
            var _loc3_ = new flash.geom.Matrix();
            _loc3_.translate(100,100);
            this.bitmapdata2.draw(this.gogoon,_loc3_);
         }
      }
   }
   function speedEffect()
   {
      var _loc4_ = this.effect.createEmptyMovieClip("linestage",4);
      _loc4_._x = 640;
      var _loc2_ = 0;
      while(_loc2_ < 300)
      {
         var _loc3_ = _loc4_.createEmptyMovieClip("line" + _loc2_,_loc2_);
         _loc3_.lineStyle(2 + random(2),16777215,10 + random(10));
         _loc3_.lineTo(100 + random(100),0);
         _loc3_._x = random(2000);
         _loc3_._y = random(480);
         _loc2_ = _loc2_ + 1;
      }
      _loc4_.cacheAsBitmap = true;
      var _loc6_ = new mx.transitions.Tween(_loc4_,"_x",mx.transitions.easing.Regular.easeIn,640,-2500,1,true);
      var _loc5_ = new mx.transitions.Tween(_loc4_,"_alpha",mx.transitions.easing.Regular.easeIn,100,0,1,true);
      _loc5_.onMotionFinished = function()
      {
         this.obj.removeMovieClip();
      };
   }
   function onEffect(type)
   {
      if(type == "bonus")
      {
         this.sound.play("snd_coinbonus");
         this.catstone.head_mc.gotoAndStop("eyes");
         this.effect.attachMovie("id_bonus_effect","bonus",2,{_x:191,_y:237});
      }
      else if(type == "speedup")
      {
         this.gogoon.effect_mc.gotoAndPlay(2);
         this.changeFace();
         this.sound.play("snd_speedup");
         this.effect.attachMovie("id_speedup_effect","speedup",1,{_x:88,_y:363});
      }
      else if(type == "best")
      {
         this.changeFace();
         this.sound.play("snd_best");
         this.effect.attachMovie("id_best_effect","best",3,{_x:474,_y:328});
      }
   }
   function deleteBlock()
   {
      this.blockarr.shift().removeMovieClip();
   }
   function groundCheck()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.blockarr.length)
      {
         if(this.blockarr[_loc2_].ground_pos.hitTest(this.gogoon._x,this.gogoon._y,true))
         {
            return true;
         }
         _loc2_ = _loc2_ + 1;
      }
      return false;
   }
   function dieCheck(num)
   {
      if(this.gogoon._y > num)
      {
         return true;
      }
      return false;
   }
   function addPoint(type)
   {
      if(type == 1)
      {
         this.score.Add(5);
         this.sound.play("snd_silvercoin");
      }
      else if(type == 2)
      {
         this.score.Add(50 - this.level * 5);
         this.sound.play("snd_goldcoin");
      }
      else if(type == 3)
      {
         this.score.Add(100 + this.level * 20);
      }
   }
   function gameOver()
   {
      delete this.gogoon.onEnterFrame;
      delete this.rope.onEnterFrame;
      delete this.stage.onEnterFrame;
      this.sound.allStop();
      this.sound.play("snd_gameover");
      if(this.scope.bestscore < this.score._num || this.scope.bestscore == undefined)
      {
         this.scope.bestscore = this.score._num;
      }
      this.facetime.onStop();
      this.catstone.head_mc.gotoAndStop("smile");
      this.bitmapdata.dispose();
      this.bitmapdata2.dispose();
      var _loc2_ = 0;
      while(_loc2_ < this.blockarr.length)
      {
         this.blockarr[_loc2_].body.gotoAndStop(2);
         _loc2_ = _loc2_ + 1;
      }
      this.mouse._use = false;
      this.rope.clear();
      this.stick._visible = false;
      this.gogoon.gotoAndStop("die");
      var _loc3_ = new OneTime();
      _loc3_._time = 0.3;
      _loc3_.onPlay = Delegate.create(this,this.gDown);
      _loc3_.onStart();
   }
   function gDown()
   {
      var _loc2_ = new mx.transitions.Tween(this.gogoon,"_y",mx.transitions.easing.Regular.easeIn,this.gogoon._y,this.gogoon._y + 250,0.5,true);
      _loc2_.onMotionFinished = Delegate.create(this,this.gameoverPopup);
   }
   function gameoverPopup()
   {
      this.onServerSend("gameover");
      var _loc2_ = this.uistage.attachMovie("id_gameover","gameover",5,{_x:230,_y:50});
      _loc2_.btn_replay.onRelease = Delegate.create(this,this.reStart);
      var owner = this;
      _loc2_.btn_replay.onRollOver = _loc2_.btn_help.onRollOver = _loc2_.btn_rank.onRollOver = function()
      {
         owner.sound.play("snd_ropecatch");
      };
      _loc2_.btn_help.onRelease = function()
      {
         owner.onDestroy();
         owner.sound.play("snd_titlebg",9999);
         owner.scope.gotoAndStop("help");
      };
      _loc2_.btn_rank._visible = false;
      _loc2_.btn_rank.onRelease = function()
      {
         owner.sound.play("snd_btn");
         owner.onServerSend("viewrank");
      };
   }
   function onDestroy()
   {
      this.catstone.head_mc.gotoAndStop("sleep");
      this.uistage.removeMovieClip();
      this.rope.removeMovieClip();
      this.gogoon.removeMovieClip();
      this.stage.removeMovieClip();
      this.itemstage.removeMovieClip();
   }
   function reStart()
   {
      this.onDestroy();
      this.sound.play("snd_btn");
      this.scope.gotoAndStop("reset");
   }
   function onServerSend(type)
   {
      if(type == "gamestart")
      {
         _global.ServerConnection.onGameStart();
      }
      else if(type == "gameover")
      {
         var _loc3_ = {score:this.score._num};
         _global.GAME = _loc3_;
         _global.ServerConnection.onGameOver(false);
      }
      else if(type == "viewrank")
      {
         _global.ServerConnection.popupVisible(true);
      }
   }
   function onCounter()
   {
      var owner = this;
      var _loc2_ = new LoadVars();
      _loc2_.onLoad = function(success)
      {
         if(success)
         {
            owner.scope.ranking_mc.count.text = this.count;
         }
      };
      _loc2_.sendAndLoad("http://jhworks.cafe24.com/count.php",_loc2_,"POST");
   }
   function onSaveScore()
   {
      var _loc2_ = new LoadVars();
      _loc2_.onLoad = function(success)
      {
         if(!success)
         {
         }
      };
      var _loc3_ = this.scope.userid;
      _loc2_.sendAndLoad("http://211.110.89.169/flashgame/insertRank.php?gameid=fsagogun2&userid=" + _loc3_ + "&score=" + this.score._num,_loc2_,"POST");
   }
   function onLoadScore()
   {
      var owner = this;
      var _loc2_ = new LoadVars();
      _loc2_.onLoad = function(success)
      {
         if(success)
         {
            owner.onRank(this.userids,this.scores);
         }
      };
      _loc2_.sendAndLoad("http://211.110.89.169/flashgame/getTop10.php?gameid=fsagogun2",_loc2_,"POST");
   }
   function onRank(userid, score)
   {
      var _loc4_ = [];
      _loc4_ = score.split("|");
      var _loc3_ = [];
      _loc3_ = userid.split("|");
      var _loc2_ = 0;
      while(_loc2_ < 10)
      {
         if(_loc3_[_loc2_] != undefined)
         {
            this.scope.ranking_mc["userid" + _loc2_].text = _loc3_[_loc2_];
            this.scope.ranking_mc["score" + _loc2_].text = _loc4_[_loc2_];
         }
         _loc2_ = _loc2_ + 1;
      }
      this.best._num = Number(_loc4_[0]);
      this.scope.bestscore = Number(_loc4_[0]);
   }
   function onTestMap()
   {
      var _loc4_ = this.scope.editor.maptxt.text;
      _loc4_ = _loc4_.split(" ").join("");
      _loc4_ = escape(_loc4_);
      var _loc3_ = [];
      _loc3_ = _loc4_.split("%0D");
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         _loc4_ = unescape(_loc3_[_loc2_]);
         _loc3_[_loc2_] = _loc4_.split(",");
         _loc2_ = _loc2_ + 1;
      }
      this.testmap = _loc3_;
   }
   function onTestItem()
   {
      var _loc4_ = this.scope.editor.itemtxt.text;
      var _loc3_ = [];
      _loc4_ = _loc4_.split(" ").join("");
      _loc4_ = escape(_loc4_);
      _loc4_ = _loc4_.split("%0D").join("");
      _loc4_ = unescape(_loc4_);
      _loc4_ = _loc4_.substr(1,_loc4_.length - 2);
      _loc3_ = _loc4_.split("],[");
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         _loc3_[_loc2_] = _loc3_[_loc2_].split(",");
         _loc2_ = _loc2_ + 1;
      }
      this.testitem = _loc3_;
   }
   function onTest(type)
   {
      this.speed = Number(this.scope.editor.speedtxt.text);
      if(type == "map")
      {
         this.test_map = true;
         this.onTestMap();
      }
      if(type == "item")
      {
         this.test_item = true;
         this.onTestItem();
      }
   }
}
