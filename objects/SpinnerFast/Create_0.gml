var fixture = physics_fixture_create();
physics_fixture_set_circle_shape(fixture, sprite_get_width(sprite_index) / 2);

var center = instance_create_layer(x, y, "Instances", Anchor);
physics_fixture_bind(fixture, id);
physics_fixture_bind(fixture, center);

physics_joint_revolute_create(id, center, x, y, -90, 90, 0, 500, 100, true, false);
