def handle_player_movement(args)
  if args.inputs.left
    args.state.player.x -= args.state.player.speed
  elsif args.inputs.right
    args.state.player.x += args.state.player.speed
  end
  if args.state.player.x +  args.state.player.w > args.grid.w
    args.state.player.x = args.grid.w - args.state.player.w
  end

  if args.state.player.x < 0
    args.state.player.x = 0
  end
end

#refactor to use spacebar here
def jump?(args)
  args.inputs.keyboard.key_down.z ||
  args.inputs.keyboard.key_down.j ||
  args.inputs.controller_one.key_down.a
end
def drop_down(args)
  args.state.player.y -= args.state.player.speed / 2
end

def tick args
  args.state.player ||= {
    x: 100,
    y: 100,
    h: 64,
    w: 64,
    path: "sprites/main-char-2.png",
    speed: 50
  }

  if jump?(args)
    args.state.player.y += args.state.player.speed
    #args.state.player.y -= args.state.player.speed / 2
  end
  handle_player_movement(args)

  args.outputs.sprites << [args.state.player]
  args.outputs.labels << [120, 120, "Hello World!"]


end
$gtk.reset
