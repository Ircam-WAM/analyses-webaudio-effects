{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 7,
			"minor" : 3,
			"revision" : 3,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"rect" : [ 1004.0, 385.0, 606.0, 707.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 1,
		"objectsnaponopen" : 1,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"lefttoolbarpinned" : 0,
		"toptoolbarpinned" : 0,
		"righttoolbarpinned" : 0,
		"bottomtoolbarpinned" : 0,
		"toolbars_unpinned_last_save" : 0,
		"tallnewobj" : 0,
		"boxanimatetime" : 200,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"style" : "",
		"subpatcher_template" : "",
		"boxes" : [ 			{
				"box" : 				{
					"id" : "obj-29",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 373.0, 374.0, 68.0, 22.0 ],
					"style" : "",
					"text" : "tapout~ 50"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-28",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "tapconnect" ],
					"patching_rect" : [ 373.0, 341.0, 80.0, 22.0 ],
					"style" : "",
					"text" : "tapin~ 10000"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-27",
					"maxclass" : "gain~",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 207.0, 445.0, 22.0, 140.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-26",
					"maxclass" : "meter~",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 478.0, 321.0, 80.0, 13.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-25",
					"maxclass" : "meter~",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 85.0, 321.0, 80.0, 13.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-24",
					"maxclass" : "meter~",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 192.0, 163.0, 80.0, 13.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-23",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 334.0, 17.0, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-21",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 334.0, 53.0, 50.0, 22.0 ],
					"style" : "",
					"text" : "loop $1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-18",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 233.5, 28.0, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-16",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 192.0, 28.0, 37.0, 22.0 ],
					"style" : "",
					"text" : "open"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-14",
					"maxclass" : "ezdac~",
					"numinlets" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 207.0, 627.0, 45.0, 45.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-13",
					"maxclass" : "gain~",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 245.0, 445.0, 22.0, 140.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-11",
					"items" : [ "rien", ",", "a2", ",", "faust" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 245.0, 301.0, 100.0, 22.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-7",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 452.0, 193.0, 37.0, 22.0 ],
					"style" : "",
					"text" : "f0 $1"
				}

			}
, 			{
				"box" : 				{
					"bitcode" : "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",
					"bitcode_size" : 11856,
					"color" : [ 1.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-12",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 444.333313, 261.666687, 64.0, 22.0 ],
					"serial_number" : "C02NV4RSFY1464 bits",
					"sourcecode" : "import(\"stdfaust.lib\"); \r\n\r\n//Faust code for Anthemes 2 frequency-shifter (one output freqshift)\r\n\r\nf0 = hslider(\"f0\", 0, -10000, 10000, 0.01);\r\n//--------------------------------------------------------------------------------------//\ntablesize = 1 << 16;\nsinustable = os.sinwaveform(tablesize);\r\n\n//--------------------------------------------------------------------------------------//\n// PHASOR THAT ACCEPTS BOTH NEGATIVE AND POSITIVE FREQUENCES\n//--------------------------------------------------------------------------------------//\npdPhasor(f) = os.phasor(1, f);\n\n//--------------------------------------------------------------------------------------//\n// SINUS ENVELOPE\n//--------------------------------------------------------------------------------------//\nsinusEnvelop(phase) = s1 + d * (s2 - s1)\n\twith {\n\t\t\tzeroToOnePhase = phase : ma.decimal;\n\t\t\tmyIndex = zeroToOnePhase * float(tablesize);\n\t\t\ti1 = int(myIndex);\n\t\t\td = ma.decimal(myIndex);\n\t\t\ti2 = (i1+1) % int(tablesize);\n\t\t\ts1 = rdtable(tablesize, sinustable, i1);\n\t\t\ts2 = rdtable(tablesize, sinustable, i2);\n\n};\r\n\r\nbq1 = fi.tf21(0.94657, -1.94632, 1., -1.94632, 0.94657);\r\nbq2 = fi.tf21(0.06338, -0.83774, 1., -0.83774, 0.06338);\r\nbq3 = fi.tf21(-0.260502, 0.02569, 1., 0.02569, -0.260502);\r\nbq4 = fi.tf21(0.870686, -1.8685, 1., -1.8685, 0.870686);\nhilbertFilter = _ <: (bq1, bq3) : (bq2, bq4);\r\n\r\n\r\ncomplexmod(f) = doubleMod\r\nwith {\r\n\tp1(a, b, c, d) = (a, c, b, d);\r\n\t//computes -sin() and cos()\r\n\tdoubleCycle = pdPhasor(f) <: (sinusEnvelop, *(-1)) : (*(-1), +(0.25)) : (_, sinusEnvelop);\r\n\tdoubleMod = (_, _, doubleCycle) : p1 : (*, *) : +;\r\n};\r\n\r\nfinalbq = fi.tf21(1., -1., 0., -0.9997, 0.);\r\n\r\nfreqShift(f) = hilbertFilter : complexmod(f) : finalbq;\r\n\r\n\r\n//process = doubleCycle(f0);\r\n\r\nprocess = freqShift(f0);",
					"sourcecode_size" : 1788,
					"style" : "",
					"text" : "faustgen~",
					"varname" : "faustgen-84c9f200",
					"version" : "1.10"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-5",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 245.0, 395.0, 70.0, 22.0 ],
					"style" : "",
					"text" : "selector~ 2"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-4",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "bang" ],
					"patching_rect" : [ 192.0, 71.0, 59.0, 22.0 ],
					"saved_object_attributes" : 					{
						"basictuning" : 440,
						"followglobaltempo" : 0,
						"formantcorrection" : 0,
						"mode" : "basic",
						"originallength" : [ 15229.64898, "ticks" ],
						"originaltempo" : 120.0,
						"pitchcorrection" : 0,
						"quality" : "basic",
						"timestretch" : [ 0 ]
					}
,
					"style" : "",
					"text" : "sfplay~ 1"
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-3",
					"maxclass" : "flonum",
					"maximum" : 20000.0,
					"minimum" : -20000.0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 322.0, 127.0, 89.996094, 22.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-19",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 255.0, 205.0, 71.0, 20.0 ],
					"style" : "",
					"text" : "loadmess 50"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-2",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 322.0, 107.0, 67.0, 18.0 ],
					"style" : "",
					"text" : "mod freq Hz"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-10",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 117.0, 254.0, 77.0, 20.0 ],
					"style" : "",
					"text" : "fshift1~"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"order" : 1,
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"order" : 0,
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-26", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"order" : 0,
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"order" : 1,
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-16", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 2 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-19", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-21", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-23", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-27", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-28", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 2 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"order" : 1,
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"order" : 0,
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"order" : 3,
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"order" : 0,
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-24", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"order" : 2,
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-27", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"order" : 1,
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-7", 0 ]
				}

			}
 ],
		"dependency_cache" : [ 			{
				"name" : "fshift1~",
				"bootpath" : "~/Dropbox/recherche_informatique_musicale_projets/migrationFaust/freqshift_a2",
				"type" : "maxb",
				"implicit" : 1
			}
, 			{
				"name" : "hilbert~",
				"bootpath" : "~/Dropbox/recherche_informatique_musicale_projets/migrationFaust/freqshift_a2",
				"type" : "maxb",
				"implicit" : 1
			}
, 			{
				"name" : "complex-mod~",
				"bootpath" : "~/Dropbox/recherche_informatique_musicale_projets/migrationFaust/freqshift_a2",
				"type" : "maxb",
				"implicit" : 1
			}
, 			{
				"name" : "faustgen~.mxo",
				"type" : "iLaX"
			}
 ],
		"autosave" : 0
	}

}
