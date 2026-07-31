on(release){
   var §\x01§ = 735;
   var §\x0f§ = 1;
   delete this.onEnterFrame;
   this._parent.sound.stop("snd_run");
   this._parent.sound.stop("snd_spin");
   this._parent.sound.play("snd_btn");
   this._parent.gotoAndStop("game");
}
