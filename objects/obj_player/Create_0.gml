
stand_mask = spr_player_mask

dimensions_unlocked = 3

max_hp = 3
hp = max_hp

run_speed = .2
max_run_speed = 2
start_run_bonus_speed = .4

move_friction = .5

step_size = 1 // How many pixels tall of steps the player can walk up

touch_knockback = 2

air_move_factor = .8

max_stair_speed = max_run_speed*.5

grav_speed = .15

jump_speed = 4
variable_jump_factor = .5

run_image_speed_factor = .6 // How much run speed effects the animation speed

book_image_speed = .2
book_image_index = 0

invincibility_frames = 40
invincible = false

casting = false
casting_sight = false

attack_cooldown_frames = 20
attack_cooldown = 0

coyote_jump_frames = 10 // How many frames after falling off ground player can still jump
coyote_jump = false // If the player can jump despite not being on ground

queue_jump_frames = 5 // How many frames before landing can the player press the jump key and still jump after landing
queue_jump = false // If the player will jump after landing

on_ground = false

state = stand

xsp = 0
ysp = 0

face = 1 // 1 for right, -1 for left

prev_face = face
prev_ysp = ysp
prev_state = state

col_list = ds_list_create()
