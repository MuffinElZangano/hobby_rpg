// ?
depth = -y;

input_check();

state_change();

switch (player_state) {
	case PlayerState.Walk: stateWalk(); break;
	case PlayerState.Run: stateRun(); break;
}

colision_check();

// Apply Movement
x+= moveX;
y+= moveY;