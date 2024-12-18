extends Control
@onready var texture_progress_bar: TextureProgressBar = $TextureProgressBar

var progress = []
var scene_name: String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ResourceLoader.load_threaded_request(scene_name)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var scene_load_status = ResourceLoader.load_threaded_get_status(scene_name,progress)
	texture_progress_bar.value = progress[0] * 100
	if scene_load_status == ResourceLoader.THREAD_LOAD_LOADED:
		var new_scene = ResourceLoader.load_threaded_get(scene_name)
		if new_scene and new_scene is PackedScene:
			var new_node = new_scene.instantiate()
			if new_node:
				get_parent().add_child(new_node)
				self.queue_free()
	
