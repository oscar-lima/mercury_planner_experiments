begin_version
3
end_version
begin_metric
1
end_metric
34
begin_variable
var0
-1
7
Atom at(youbot-brsu-5, s1)
Atom at(youbot-brsu-5, s2)
Atom at(youbot-brsu-5, s3)
Atom at(youbot-brsu-5, s4)
Atom at(youbot-brsu-5, s5)
Atom at(youbot-brsu-5, s6)
Atom at(youbot-brsu-5, start)
end_variable
begin_variable
var1
-1
2
Atom gripper_is_free(dynamixel)
NegatedAtom gripper_is_free(dynamixel)
end_variable
begin_variable
var2
-1
2
Atom holding(dynamixel, o1)
NegatedAtom holding(dynamixel, o1)
end_variable
begin_variable
var3
-1
2
Atom holding(dynamixel, o2)
NegatedAtom holding(dynamixel, o2)
end_variable
begin_variable
var4
-1
2
Atom occupied(platform_left)
NegatedAtom occupied(platform_left)
end_variable
begin_variable
var5
-1
2
Atom occupied(platform_middle)
NegatedAtom occupied(platform_middle)
end_variable
begin_variable
var6
-1
2
Atom occupied(platform_right)
NegatedAtom occupied(platform_right)
end_variable
begin_variable
var7
-1
2
Atom on(o1, s1)
NegatedAtom on(o1, s1)
end_variable
begin_variable
var8
-1
2
Atom on(o1, s2)
NegatedAtom on(o1, s2)
end_variable
begin_variable
var9
-1
2
Atom on(o1, s3)
NegatedAtom on(o1, s3)
end_variable
begin_variable
var10
-1
2
Atom on(o1, s4)
NegatedAtom on(o1, s4)
end_variable
begin_variable
var11
-1
2
Atom on(o1, s5)
NegatedAtom on(o1, s5)
end_variable
begin_variable
var12
-1
2
Atom on(o1, s6)
NegatedAtom on(o1, s6)
end_variable
begin_variable
var13
-1
2
Atom on(o1, start)
NegatedAtom on(o1, start)
end_variable
begin_variable
var14
-1
2
Atom on(o2, s1)
NegatedAtom on(o2, s1)
end_variable
begin_variable
var15
-1
2
Atom on(o2, s2)
NegatedAtom on(o2, s2)
end_variable
begin_variable
var16
-1
2
Atom on(o2, s3)
NegatedAtom on(o2, s3)
end_variable
begin_variable
var17
-1
2
Atom on(o2, s4)
NegatedAtom on(o2, s4)
end_variable
begin_variable
var18
-1
2
Atom on(o2, s5)
NegatedAtom on(o2, s5)
end_variable
begin_variable
var19
-1
2
Atom on(o2, s6)
NegatedAtom on(o2, s6)
end_variable
begin_variable
var20
-1
2
Atom on(o2, start)
NegatedAtom on(o2, start)
end_variable
begin_variable
var21
-1
2
Atom perceived(s1)
NegatedAtom perceived(s1)
end_variable
begin_variable
var22
-1
2
Atom perceived(s2)
NegatedAtom perceived(s2)
end_variable
begin_variable
var23
-1
2
Atom perceived(s3)
NegatedAtom perceived(s3)
end_variable
begin_variable
var24
-1
2
Atom perceived(s4)
NegatedAtom perceived(s4)
end_variable
begin_variable
var25
-1
2
Atom perceived(s5)
NegatedAtom perceived(s5)
end_variable
begin_variable
var26
-1
2
Atom perceived(s6)
NegatedAtom perceived(s6)
end_variable
begin_variable
var27
-1
2
Atom perceived(start)
NegatedAtom perceived(start)
end_variable
begin_variable
var28
-1
2
Atom stored(o1, platform_left)
NegatedAtom stored(o1, platform_left)
end_variable
begin_variable
var29
-1
2
Atom stored(o1, platform_middle)
NegatedAtom stored(o1, platform_middle)
end_variable
begin_variable
var30
-1
2
Atom stored(o1, platform_right)
NegatedAtom stored(o1, platform_right)
end_variable
begin_variable
var31
-1
2
Atom stored(o2, platform_left)
NegatedAtom stored(o2, platform_left)
end_variable
begin_variable
var32
-1
2
Atom stored(o2, platform_middle)
NegatedAtom stored(o2, platform_middle)
end_variable
begin_variable
var33
-1
2
Atom stored(o2, platform_right)
NegatedAtom stored(o2, platform_right)
end_variable
1
begin_mutex_group
7
0 0
0 1
0 2
0 3
0 4
0 5
0 6
end_mutex_group
begin_state
6
0
1
1
1
1
1
0
1
1
1
1
1
1
1
1
1
0
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
end_state
begin_goal
2
11 0
18 0
end_goal
96
begin_operator
move_base_safe s1 s1 youbot-brsu-5 dynamixel
2
0 0
1 0
1
0 21 -1 1
100
end_operator
begin_operator
move_base_safe s1 s2 youbot-brsu-5 dynamixel
1
1 0
3
0 0 0 1
0 21 -1 1
0 22 -1 1
3
end_operator
begin_operator
move_base_safe s1 s3 youbot-brsu-5 dynamixel
1
1 0
3
0 0 0 2
0 21 -1 1
0 23 -1 1
6
end_operator
begin_operator
move_base_safe s1 s4 youbot-brsu-5 dynamixel
1
1 0
3
0 0 0 3
0 21 -1 1
0 24 -1 1
6
end_operator
begin_operator
move_base_safe s1 s5 youbot-brsu-5 dynamixel
1
1 0
3
0 0 0 4
0 21 -1 1
0 25 -1 1
6
end_operator
begin_operator
move_base_safe s1 s6 youbot-brsu-5 dynamixel
1
1 0
3
0 0 0 5
0 21 -1 1
0 26 -1 1
6
end_operator
begin_operator
move_base_safe s1 start youbot-brsu-5 dynamixel
1
1 0
3
0 0 0 6
0 21 -1 1
0 27 -1 1
2
end_operator
begin_operator
move_base_safe s2 s1 youbot-brsu-5 dynamixel
1
1 0
3
0 0 1 0
0 21 -1 1
0 22 -1 1
3
end_operator
begin_operator
move_base_safe s2 s2 youbot-brsu-5 dynamixel
2
0 1
1 0
1
0 22 -1 1
100
end_operator
begin_operator
move_base_safe s2 s3 youbot-brsu-5 dynamixel
1
1 0
3
0 0 1 2
0 22 -1 1
0 23 -1 1
6
end_operator
begin_operator
move_base_safe s2 s4 youbot-brsu-5 dynamixel
1
1 0
3
0 0 1 3
0 22 -1 1
0 24 -1 1
6
end_operator
begin_operator
move_base_safe s2 s5 youbot-brsu-5 dynamixel
1
1 0
3
0 0 1 4
0 22 -1 1
0 25 -1 1
5
end_operator
begin_operator
move_base_safe s2 s6 youbot-brsu-5 dynamixel
1
1 0
3
0 0 1 5
0 22 -1 1
0 26 -1 1
5
end_operator
begin_operator
move_base_safe s2 start youbot-brsu-5 dynamixel
1
1 0
3
0 0 1 6
0 22 -1 1
0 27 -1 1
3
end_operator
begin_operator
move_base_safe s3 s1 youbot-brsu-5 dynamixel
1
1 0
3
0 0 2 0
0 21 -1 1
0 23 -1 1
6
end_operator
begin_operator
move_base_safe s3 s2 youbot-brsu-5 dynamixel
1
1 0
3
0 0 2 1
0 22 -1 1
0 23 -1 1
6
end_operator
begin_operator
move_base_safe s3 s3 youbot-brsu-5 dynamixel
2
0 2
1 0
1
0 23 -1 1
100
end_operator
begin_operator
move_base_safe s3 s4 youbot-brsu-5 dynamixel
1
1 0
3
0 0 2 3
0 23 -1 1
0 24 -1 1
1
end_operator
begin_operator
move_base_safe s3 s5 youbot-brsu-5 dynamixel
1
1 0
3
0 0 2 4
0 23 -1 1
0 25 -1 1
2
end_operator
begin_operator
move_base_safe s3 s6 youbot-brsu-5 dynamixel
1
1 0
3
0 0 2 5
0 23 -1 1
0 26 -1 1
3
end_operator
begin_operator
move_base_safe s3 start youbot-brsu-5 dynamixel
1
1 0
3
0 0 2 6
0 23 -1 1
0 27 -1 1
6
end_operator
begin_operator
move_base_safe s4 s1 youbot-brsu-5 dynamixel
1
1 0
3
0 0 3 0
0 21 -1 1
0 24 -1 1
6
end_operator
begin_operator
move_base_safe s4 s2 youbot-brsu-5 dynamixel
1
1 0
3
0 0 3 1
0 22 -1 1
0 24 -1 1
6
end_operator
begin_operator
move_base_safe s4 s3 youbot-brsu-5 dynamixel
1
1 0
3
0 0 3 2
0 23 -1 1
0 24 -1 1
1
end_operator
begin_operator
move_base_safe s4 s4 youbot-brsu-5 dynamixel
2
0 3
1 0
1
0 24 -1 1
100
end_operator
begin_operator
move_base_safe s4 s5 youbot-brsu-5 dynamixel
1
1 0
3
0 0 3 4
0 24 -1 1
0 25 -1 1
1
end_operator
begin_operator
move_base_safe s4 s6 youbot-brsu-5 dynamixel
1
1 0
3
0 0 3 5
0 24 -1 1
0 26 -1 1
2
end_operator
begin_operator
move_base_safe s4 start youbot-brsu-5 dynamixel
1
1 0
3
0 0 3 6
0 24 -1 1
0 27 -1 1
6
end_operator
begin_operator
move_base_safe s5 s1 youbot-brsu-5 dynamixel
1
1 0
3
0 0 4 0
0 21 -1 1
0 25 -1 1
5
end_operator
begin_operator
move_base_safe s5 s2 youbot-brsu-5 dynamixel
1
1 0
3
0 0 4 1
0 22 -1 1
0 25 -1 1
5
end_operator
begin_operator
move_base_safe s5 s3 youbot-brsu-5 dynamixel
1
1 0
3
0 0 4 2
0 23 -1 1
0 25 -1 1
2
end_operator
begin_operator
move_base_safe s5 s4 youbot-brsu-5 dynamixel
1
1 0
3
0 0 4 3
0 24 -1 1
0 25 -1 1
1
end_operator
begin_operator
move_base_safe s5 s5 youbot-brsu-5 dynamixel
2
0 4
1 0
1
0 25 -1 1
100
end_operator
begin_operator
move_base_safe s5 s6 youbot-brsu-5 dynamixel
1
1 0
3
0 0 4 5
0 25 -1 1
0 26 -1 1
1
end_operator
begin_operator
move_base_safe s5 start youbot-brsu-5 dynamixel
1
1 0
3
0 0 4 6
0 25 -1 1
0 27 -1 1
6
end_operator
begin_operator
move_base_safe s6 s1 youbot-brsu-5 dynamixel
1
1 0
3
0 0 5 0
0 21 -1 1
0 26 -1 1
6
end_operator
begin_operator
move_base_safe s6 s2 youbot-brsu-5 dynamixel
1
1 0
3
0 0 5 1
0 22 -1 1
0 26 -1 1
5
end_operator
begin_operator
move_base_safe s6 s3 youbot-brsu-5 dynamixel
1
1 0
3
0 0 5 2
0 23 -1 1
0 26 -1 1
3
end_operator
begin_operator
move_base_safe s6 s4 youbot-brsu-5 dynamixel
1
1 0
3
0 0 5 3
0 24 -1 1
0 26 -1 1
2
end_operator
begin_operator
move_base_safe s6 s5 youbot-brsu-5 dynamixel
1
1 0
3
0 0 5 4
0 25 -1 1
0 26 -1 1
1
end_operator
begin_operator
move_base_safe s6 s6 youbot-brsu-5 dynamixel
2
0 5
1 0
1
0 26 -1 1
100
end_operator
begin_operator
move_base_safe s6 start youbot-brsu-5 dynamixel
1
1 0
3
0 0 5 6
0 26 -1 1
0 27 -1 1
6
end_operator
begin_operator
move_base_safe start s1 youbot-brsu-5 dynamixel
1
1 0
3
0 0 6 0
0 21 -1 1
0 27 -1 1
2
end_operator
begin_operator
move_base_safe start s2 youbot-brsu-5 dynamixel
1
1 0
3
0 0 6 1
0 22 -1 1
0 27 -1 1
3
end_operator
begin_operator
move_base_safe start s3 youbot-brsu-5 dynamixel
1
1 0
3
0 0 6 2
0 23 -1 1
0 27 -1 1
6
end_operator
begin_operator
move_base_safe start s4 youbot-brsu-5 dynamixel
1
1 0
3
0 0 6 3
0 24 -1 1
0 27 -1 1
6
end_operator
begin_operator
move_base_safe start s5 youbot-brsu-5 dynamixel
1
1 0
3
0 0 6 4
0 25 -1 1
0 27 -1 1
6
end_operator
begin_operator
move_base_safe start s6 youbot-brsu-5 dynamixel
1
1 0
3
0 0 6 5
0 26 -1 1
0 27 -1 1
6
end_operator
begin_operator
move_base_safe start start youbot-brsu-5 dynamixel
2
0 6
1 0
1
0 27 -1 1
100
end_operator
begin_operator
perceive_location s1 youbot-brsu-5 dynamixel
2
0 0
1 0
1
0 21 1 0
1
end_operator
begin_operator
perceive_location s2 youbot-brsu-5 dynamixel
2
0 1
1 0
1
0 22 1 0
1
end_operator
begin_operator
perceive_location s3 youbot-brsu-5 dynamixel
2
0 2
1 0
1
0 23 1 0
1
end_operator
begin_operator
perceive_location s4 youbot-brsu-5 dynamixel
2
0 3
1 0
1
0 24 1 0
1
end_operator
begin_operator
perceive_location s5 youbot-brsu-5 dynamixel
2
0 4
1 0
1
0 25 1 0
1
end_operator
begin_operator
perceive_location s6 youbot-brsu-5 dynamixel
2
0 5
1 0
1
0 26 1 0
1
end_operator
begin_operator
perceive_location start youbot-brsu-5 dynamixel
2
0 6
1 0
1
0 27 1 0
1
end_operator
begin_operator
pick o1 s1 youbot-brsu-5 dynamixel
2
0 0
21 0
3
0 1 0 1
0 2 1 0
0 7 0 1
1
end_operator
begin_operator
pick o1 s2 youbot-brsu-5 dynamixel
2
0 1
22 0
3
0 1 0 1
0 2 1 0
0 8 0 1
1
end_operator
begin_operator
pick o1 s3 youbot-brsu-5 dynamixel
2
0 2
23 0
3
0 1 0 1
0 2 1 0
0 9 0 1
1
end_operator
begin_operator
pick o1 s4 youbot-brsu-5 dynamixel
2
0 3
24 0
3
0 1 0 1
0 2 1 0
0 10 0 1
1
end_operator
begin_operator
pick o1 s5 youbot-brsu-5 dynamixel
2
0 4
25 0
3
0 1 0 1
0 2 1 0
0 11 0 1
1
end_operator
begin_operator
pick o1 s6 youbot-brsu-5 dynamixel
2
0 5
26 0
3
0 1 0 1
0 2 1 0
0 12 0 1
1
end_operator
begin_operator
pick o1 start youbot-brsu-5 dynamixel
2
0 6
27 0
3
0 1 0 1
0 2 1 0
0 13 0 1
1
end_operator
begin_operator
pick o2 s1 youbot-brsu-5 dynamixel
2
0 0
21 0
3
0 1 0 1
0 3 1 0
0 14 0 1
1
end_operator
begin_operator
pick o2 s2 youbot-brsu-5 dynamixel
2
0 1
22 0
3
0 1 0 1
0 3 1 0
0 15 0 1
1
end_operator
begin_operator
pick o2 s3 youbot-brsu-5 dynamixel
2
0 2
23 0
3
0 1 0 1
0 3 1 0
0 16 0 1
1
end_operator
begin_operator
pick o2 s4 youbot-brsu-5 dynamixel
2
0 3
24 0
3
0 1 0 1
0 3 1 0
0 17 0 1
1
end_operator
begin_operator
pick o2 s5 youbot-brsu-5 dynamixel
2
0 4
25 0
3
0 1 0 1
0 3 1 0
0 18 0 1
1
end_operator
begin_operator
pick o2 s6 youbot-brsu-5 dynamixel
2
0 5
26 0
3
0 1 0 1
0 3 1 0
0 19 0 1
1
end_operator
begin_operator
pick o2 start youbot-brsu-5 dynamixel
2
0 6
27 0
3
0 1 0 1
0 3 1 0
0 20 0 1
1
end_operator
begin_operator
place o1 s1 youbot-brsu-5 dynamixel
2
0 0
21 1
3
0 1 1 0
0 2 0 1
0 7 1 0
1
end_operator
begin_operator
place o1 s2 youbot-brsu-5 dynamixel
2
0 1
22 1
3
0 1 1 0
0 2 0 1
0 8 1 0
1
end_operator
begin_operator
place o1 s3 youbot-brsu-5 dynamixel
2
0 2
23 1
3
0 1 1 0
0 2 0 1
0 9 1 0
1
end_operator
begin_operator
place o1 s4 youbot-brsu-5 dynamixel
2
0 3
24 1
3
0 1 1 0
0 2 0 1
0 10 1 0
1
end_operator
begin_operator
place o1 s5 youbot-brsu-5 dynamixel
2
0 4
25 1
3
0 1 1 0
0 2 0 1
0 11 1 0
1
end_operator
begin_operator
place o1 s6 youbot-brsu-5 dynamixel
2
0 5
26 1
3
0 1 1 0
0 2 0 1
0 12 1 0
1
end_operator
begin_operator
place o1 start youbot-brsu-5 dynamixel
2
0 6
27 1
3
0 1 1 0
0 2 0 1
0 13 1 0
1
end_operator
begin_operator
place o2 s1 youbot-brsu-5 dynamixel
2
0 0
21 1
3
0 1 1 0
0 3 0 1
0 14 1 0
1
end_operator
begin_operator
place o2 s2 youbot-brsu-5 dynamixel
2
0 1
22 1
3
0 1 1 0
0 3 0 1
0 15 1 0
1
end_operator
begin_operator
place o2 s3 youbot-brsu-5 dynamixel
2
0 2
23 1
3
0 1 1 0
0 3 0 1
0 16 1 0
1
end_operator
begin_operator
place o2 s4 youbot-brsu-5 dynamixel
2
0 3
24 1
3
0 1 1 0
0 3 0 1
0 17 1 0
1
end_operator
begin_operator
place o2 s5 youbot-brsu-5 dynamixel
2
0 4
25 1
3
0 1 1 0
0 3 0 1
0 18 1 0
1
end_operator
begin_operator
place o2 s6 youbot-brsu-5 dynamixel
2
0 5
26 1
3
0 1 1 0
0 3 0 1
0 19 1 0
1
end_operator
begin_operator
place o2 start youbot-brsu-5 dynamixel
2
0 6
27 1
3
0 1 1 0
0 3 0 1
0 20 1 0
1
end_operator
begin_operator
stage o1 platform_left dynamixel
0
4
0 1 1 0
0 2 0 1
0 4 1 0
0 28 -1 0
1
end_operator
begin_operator
stage o1 platform_middle dynamixel
0
4
0 1 1 0
0 2 0 1
0 5 1 0
0 29 -1 0
1
end_operator
begin_operator
stage o1 platform_right dynamixel
0
4
0 1 1 0
0 2 0 1
0 6 1 0
0 30 -1 0
1
end_operator
begin_operator
stage o2 platform_left dynamixel
0
4
0 1 1 0
0 3 0 1
0 4 1 0
0 31 -1 0
1
end_operator
begin_operator
stage o2 platform_middle dynamixel
0
4
0 1 1 0
0 3 0 1
0 5 1 0
0 32 -1 0
1
end_operator
begin_operator
stage o2 platform_right dynamixel
0
4
0 1 1 0
0 3 0 1
0 6 1 0
0 33 -1 0
1
end_operator
begin_operator
unstage o1 platform_left dynamixel
0
4
0 1 0 1
0 2 1 0
0 4 -1 1
0 28 0 1
1
end_operator
begin_operator
unstage o1 platform_middle dynamixel
0
4
0 1 0 1
0 2 1 0
0 5 -1 1
0 29 0 1
1
end_operator
begin_operator
unstage o1 platform_right dynamixel
0
4
0 1 0 1
0 2 1 0
0 6 -1 1
0 30 0 1
1
end_operator
begin_operator
unstage o2 platform_left dynamixel
0
4
0 1 0 1
0 3 1 0
0 4 -1 1
0 31 0 1
1
end_operator
begin_operator
unstage o2 platform_middle dynamixel
0
4
0 1 0 1
0 3 1 0
0 5 -1 1
0 32 0 1
1
end_operator
begin_operator
unstage o2 platform_right dynamixel
0
4
0 1 0 1
0 3 1 0
0 6 -1 1
0 33 0 1
1
end_operator
0
