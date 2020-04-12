/// @description Controls

if !global.in_dialogue{
	left_key = keyboard_check(vk_left) || keyboard_check(ord("A"))
	right_key = keyboard_check(vk_right) || keyboard_check(ord("D"))
	down_key = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))
	up_key = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))
	jump_key = keyboard_check_pressed(vk_space)
	jump_key_released = keyboard_check_released(vk_space)
	mouse_r_released = mouse_check_button_released(mb_right)
	mouse_r_pressed = mouse_check_button_pressed(mb_right)
	mouse_r = mouse_check_button(mb_right)
	mousel_pressed = mouse_check_button_pressed(mb_left)
	mouse_l = mouse_check_button(mb_left)
	sprint_key = keyboard_check(vk_shift)
}