
# the only changes in this branch:
	modified:   configuration.yaml
	modified:   group.yaml
	modified:   input_slider.yaml
	modified:   sensor.yaml

# full diff:

```
git diff .
diff --git a/configuration.yaml b/configuration.yaml
index 816f96d..1f7f457 100644
--- a/configuration.yaml
+++ b/configuration.yaml
@@ -50,7 +50,7 @@ automation: !include automation.yaml
 camera: !include camera.yaml
 group: !include group.yaml
 input_select: !include input_select.yaml
-# input_slider: !include input_slider.yaml
+input_slider: !include input_slider.yaml
 # notify: !include notify.yaml
 script: !include script.yaml
 sensor: !include sensor.yaml
diff --git a/group.yaml b/group.yaml
index c900bca..bb76fa7 100644
--- a/group.yaml
+++ b/group.yaml
@@ -56,10 +56,10 @@ cctv:
 ############################
 
 card_ds:
-  name: digitalSTROM Status
+  name: DigitalSTROM Status
   entities:
     # - script.restart_ha
-    - sensor.ds_power_consumption
+    - sensor.power_consumption
     - script.ds_scene_present
     - script.ds_scene_abscent
     - script.ds_scene_door_bell
@@ -68,12 +68,14 @@ card_ds:
 card_ds_living:
   name: Living Room
   entities:
-    - sensor.ds_living_room_light_status
+    - sensor.living_light_status
+    - sensor.power_consumption
     - script.ds_living_light_1
     - script.ds_living_light_2
     - script.ds_living_light_3
     - script.ds_living_light_4
     - script.ds_living_light_0
+    - input_slider.slider_living_light
 
 card_ds_dining:
   name: Dining Room
diff --git a/input_slider.yaml b/input_slider.yaml
index e69de29..7da6f2f 100644
--- a/input_slider.yaml
+++ b/input_slider.yaml
@@ -0,0 +1,8 @@
+
+# FIXME just for screenshot mockup
+slider_living_light:
+  name: Slider
+  initial: 0
+  min: 0
+  max: 255
+  step: 1
diff --git a/sensor.yaml b/sensor.yaml
index 34a8a0a..32b9a4b 100644
--- a/sensor.yaml
+++ b/sensor.yaml
@@ -2,7 +2,7 @@
 - platform: rest
   resource: http://localhost:3000/ds/getLastCallSceneName?id=1&groupID=1
   method: GET
-  name: dS Living Room Light Status
+  name: Living Light Status
   value_template: '{{ value_json.result.name }}'
 
 - platform: rest
@@ -22,3 +22,14 @@
   method: GET
   name: dS Office Light Status
   value_template: '{{ value_json.result.name }}'
+
+
+
+
+# FIXME change the meter dsid (find it here http://localhost:3000/ds/api?path=/json/apartment/getCircuits)
+- platform: rest
+  resource: http://localhost:3000/ds/api?path=/json/circuit/getConsumption?id=303505d7f80002c0000034e3
+  method: GET
+  name: Power Consumption
+  value_template: '{{ value_json.result.consumption }}'
+  unit_of_measurement: W
\ No newline at end of file
```
