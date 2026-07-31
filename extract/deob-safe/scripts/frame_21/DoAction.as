var §\x01§ = 385;
var §\x0f§ = 1;
delete game;
var game = new SetGame(this);
game.onStart();
if(testmap)
{
   game.onTest("map");
}
if(testitem)
{
   game.onTest("item");
}
