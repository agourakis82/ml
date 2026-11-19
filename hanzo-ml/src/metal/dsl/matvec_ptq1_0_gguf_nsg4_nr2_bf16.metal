#include <metal_stdlib>
using namespace metal;

struct alignas(4) half_2 {
    half i_0;
    half i_1;
};

struct info_st {
    uint static_meta[8];
};

[[kernel]]
void matvec_ptq1_0_gguf_f_(
    const device uint * buffer_0 [[buffer(0)]],
    const device bfloat * buffer_1 [[buffer(1)]],
    device bfloat * buffer_2 [[buffer(2)]],
    const device uint * buffer_3 [[buffer(3)]],
    constant info_st& info [[buffer(4)]],
    uint3 threads_per_threadgroup [[threads_per_threadgroup]],
    uint3 threadgroups_per_grid [[threadgroups_per_grid]],
    uint3 thread_pos_in_threadgroup [[thread_position_in_threadgroup]],
    uint3 threadgroup_pos_in_grid [[threadgroup_position_in_grid]],
    uint simd_size [[threads_per_simdgroup]]
) {
uint threadgroup_index_in_grid = (threadgroup_pos_in_grid.z * threadgroups_per_grid.y * threadgroups_per_grid.x) + (threadgroup_pos_in_grid.y * threadgroups_per_grid.x) + threadgroup_pos_in_grid.x;
uint threads_per_simdgroup_checked = min(simd_size, threads_per_threadgroup.x * threads_per_threadgroup.y * threads_per_threadgroup.z);
float l_arr_14[2];

float l_mut_9;
uint l_mut_16;
uint l_mut_36;
uint l_mut_38;
uint l_mut_39;
uint l_mut_149;
const uint l_0 = buffer_3[uint(0)];
const uint l_1 = buffer_3[uint(1)];
const uint l_2 = l_0 / uint(128);
const uint l_3 = threadgroup_index_in_grid * uint(4);
const uint l_4 = l_3 + thread_pos_in_threadgroup.y;
const uint l_5 = l_4 * uint(2);
const uint l_6 = thread_pos_in_threadgroup.x / uint(8);
const uint l_7 = thread_pos_in_threadgroup.x % uint(8);
const uint l_8 = l_7 / uint(2);
l_mut_9 = float(1.0);
const bool l_10 = l_8 == uint(1);
if (l_10) {
l_mut_9 = float(3.0);
} else {
const bool l_11 = l_8 == uint(2);
if (l_11) {
l_mut_9 = float(9.0);
} else {
const bool l_12 = l_8 == uint(3);
if (l_12) {
l_mut_9 = float(27.0);
}
}
}
const float l_13 = float(3.0) * l_mut_9;
l_arr_14[uint(0)] = float(0.0);
l_arr_14[uint(1)] = float(0.0);
const uint l_15 = uint(7) * l_2;
l_mut_16 = uint(0);
const bool l_17 = l_5 < l_1;
if (l_17) {
const uint l_18 = l_1 - uint(1);
const uint l_19 = l_18 - l_5;
l_mut_16 = l_19;
}
const uint l_20 = l_mut_16 * l_15;
const uint l_21 = l_5 * l_2;
const uint l_22 = l_21 + l_6;
const uint l_23 = uint(7) * l_22;
const uint l_24 = uint(2) * l_7;
const uint l_25 = l_7 / uint(2);
const uint l_26 = l_7 % uint(2);
const uint l_27 = uint(16) * l_26;
const uint l_28 = l_27 + uint(8);
const uint l_29 = l_7 / uint(4);
const uint l_30 = uint(4) + l_29;
const uint l_31 = l_7 % uint(4);
const uint l_32 = uint(8) * l_31;
const uint l_33 = l_7 % uint(2);
const uint l_34 = uint(8) * l_33;
const bool l_35 = l_5 < l_1;
if (l_35) {
l_mut_36 = l_6;
const uint l_37 = l_6 * uint(128);
l_mut_38 = l_37;
l_mut_39 = l_23;
while (true) {
const bool l_40 = l_mut_36 < l_2;
const bool l_41 = !l_40;
if (l_41) {
break;}
const uint l_42 = l_mut_38 + l_24;
const bfloat l_43 = buffer_1[l_42];
const float l_44 = float(l_43);
const uint l_45 = l_mut_38 + uint(16);
const uint l_46 = l_45 + l_24;
const bfloat l_47 = buffer_1[l_46];
const float l_48 = float(l_47);
const uint l_49 = l_mut_38 + uint(32);
const uint l_50 = l_49 + l_24;
const bfloat l_51 = buffer_1[l_50];
const float l_52 = float(l_51);
const uint l_53 = l_mut_38 + uint(48);
const uint l_54 = l_53 + l_24;
const bfloat l_55 = buffer_1[l_54];
const float l_56 = float(l_55);
const uint l_57 = l_mut_38 + uint(64);
const uint l_58 = l_57 + l_24;
const bfloat l_59 = buffer_1[l_58];
const float l_60 = float(l_59);
const uint l_61 = l_mut_38 + l_24;
const uint l_62 = l_61 + uint(1);
const bfloat l_63 = buffer_1[l_62];
const float l_64 = float(l_63);
const uint l_65 = l_mut_38 + uint(16);
const uint l_66 = l_65 + l_24;
const uint l_67 = l_66 + uint(1);
const bfloat l_68 = buffer_1[l_67];
const float l_69 = float(l_68);
const uint l_70 = l_mut_38 + uint(32);
const uint l_71 = l_70 + l_24;
const uint l_72 = l_71 + uint(1);
const bfloat l_73 = buffer_1[l_72];
const float l_74 = float(l_73);
const uint l_75 = l_mut_38 + uint(48);
const uint l_76 = l_75 + l_24;
const uint l_77 = l_76 + uint(1);
const bfloat l_78 = buffer_1[l_77];
const float l_79 = float(l_78);
const uint l_80 = l_mut_38 + uint(64);
const uint l_81 = l_80 + l_24;
const uint l_82 = l_81 + uint(1);
const bfloat l_83 = buffer_1[l_82];
const float l_84 = float(l_83);
const uint l_85 = l_mut_38 + uint(80);
const uint l_86 = l_85 + l_7;
const bfloat l_87 = buffer_1[l_86];
const float l_88 = float(l_87);
const uint l_89 = l_mut_38 + uint(88);
const uint l_90 = l_89 + l_7;
const bfloat l_91 = buffer_1[l_90];
const float l_92 = float(l_91);
const uint l_93 = l_mut_38 + uint(96);
const uint l_94 = l_93 + l_7;
const bfloat l_95 = buffer_1[l_94];
const float l_96 = float(l_95);
const uint l_97 = l_mut_38 + uint(104);
const uint l_98 = l_97 + l_7;
const bfloat l_99 = buffer_1[l_98];
const float l_100 = float(l_99);
const uint l_101 = l_mut_38 + uint(112);
const uint l_102 = l_101 + l_7;
const bfloat l_103 = buffer_1[l_102];
const float l_104 = float(l_103);
const uint l_105 = l_mut_38 + uint(120);
const uint l_106 = l_105 + l_7;
const bfloat l_107 = buffer_1[l_106];
const float l_108 = float(l_107);
const float l_109 = l_44 + l_48;
const float l_110 = l_109 + l_52;
const float l_111 = l_110 + l_56;
const float l_112 = l_111 + l_60;
const float l_113 = l_64 + l_69;
const float l_114 = l_113 + l_74;
const float l_115 = l_114 + l_79;
const float l_116 = l_115 + l_84;
const float l_117 = l_112 + l_116;
const float l_118 = l_88 + l_92;
const float l_119 = l_118 + l_96;
const float l_120 = l_119 + l_100;
const float l_121 = l_120 + l_104;
const float l_122 = l_117 + l_121;
const float l_123 = l_122 + l_108;
const float l_124 = float(3.0) * l_48;
const float l_125 = l_44 - l_124;
const float l_126 = float(3.0) * l_52;
const float l_127 = l_48 - l_126;
const float l_128 = float(3.0) * l_56;
const float l_129 = l_52 - l_128;
const float l_130 = float(3.0) * l_60;
const float l_131 = l_56 - l_130;
const float l_132 = float(3.0) * l_69;
const float l_133 = l_64 - l_132;
const float l_134 = float(3.0) * l_74;
const float l_135 = l_69 - l_134;
const float l_136 = float(3.0) * l_79;
const float l_137 = l_74 - l_136;
const float l_138 = float(3.0) * l_84;
const float l_139 = l_79 - l_138;
const float l_140 = float(3.0) * l_92;
const float l_141 = l_88 - l_140;
const float l_142 = float(3.0) * l_96;
const float l_143 = l_92 - l_142;
const float l_144 = float(3.0) * l_100;
const float l_145 = l_96 - l_144;
const float l_146 = float(3.0) * l_104;
const float l_147 = l_100 - l_146;
const uint l_148 = uint(0) * l_15;
l_mut_149 = l_148;
const bool l_150 = uint(0) > l_mut_16;
if (l_150) {
l_mut_149 = l_20;
}
const uint l_151 = l_mut_39 + l_mut_149;
const uint l_152 = l_151 + l_25;
const uint l_153 = buffer_0[l_152];
const uint l_154 = l_153 >> l_27;
const uint l_155 = l_154 & uint(255);
const uint l_156 = l_153 >> l_28;
const uint l_157 = l_156 & uint(255);
const uint l_158 = l_151 + l_30;
const uint l_159 = buffer_0[l_158];
const uint l_160 = l_159 >> l_32;
const uint l_161 = l_160 & uint(255);
const uint l_162 = l_151 + uint(6);
const uint l_163 = buffer_0[l_162];
const uint l_164 = l_163 >> l_34;
const uint l_165 = l_164 & uint(255);
const uint l_166 = l_163 >> uint(16);
const uint l_167 = l_166 & uint(65535);
const half_2 l_168 = reinterpret_cast<thread half_2 const&>(l_167);
const half l_169 = l_168.i_0;
const float l_170 = float(l_169);
const float l_171 = float(l_165);
const float l_172 = l_171 * float(0.00390625);
const float l_173 = l_13 * l_172;
const float l_174 = floor(l_173);
const float l_175 = l_mut_9 * l_172;
const float l_176 = floor(l_175);
const float l_177 = float(3.0) * l_176;
const float l_178 = l_174 - l_177;
const float l_179 = float(l_155);
const float l_180 = l_179 * float(0.00390625);
const float l_181 = float(3.0) * l_180;
const float l_182 = floor(l_181);
const float l_183 = l_182 * l_125;
const float l_184 = float(9.0) * l_180;
const float l_185 = floor(l_184);
const float l_186 = l_185 * l_127;
const float l_187 = l_183 + l_186;
const float l_188 = float(27.0) * l_180;
const float l_189 = floor(l_188);
const float l_190 = l_189 * l_129;
const float l_191 = l_187 + l_190;
const float l_192 = float(81.0) * l_180;
const float l_193 = floor(l_192);
const float l_194 = l_193 * l_131;
const float l_195 = l_191 + l_194;
const float l_196 = float(243.0) * l_180;
const float l_197 = floor(l_196);
const float l_198 = l_197 * l_60;
const float l_199 = l_195 + l_198;
const float l_200 = float(l_157);
const float l_201 = l_200 * float(0.00390625);
const float l_202 = float(3.0) * l_201;
const float l_203 = floor(l_202);
const float l_204 = l_203 * l_133;
const float l_205 = float(9.0) * l_201;
const float l_206 = floor(l_205);
const float l_207 = l_206 * l_135;
const float l_208 = l_204 + l_207;
const float l_209 = float(27.0) * l_201;
const float l_210 = floor(l_209);
const float l_211 = l_210 * l_137;
const float l_212 = l_208 + l_211;
const float l_213 = float(81.0) * l_201;
const float l_214 = floor(l_213);
const float l_215 = l_214 * l_139;
const float l_216 = l_212 + l_215;
const float l_217 = float(243.0) * l_201;
const float l_218 = floor(l_217);
const float l_219 = l_218 * l_84;
const float l_220 = l_216 + l_219;
const float l_221 = l_199 + l_220;
const float l_222 = float(l_161);
const float l_223 = l_222 * float(0.00390625);
const float l_224 = float(3.0) * l_223;
const float l_225 = floor(l_224);
const float l_226 = l_225 * l_141;
const float l_227 = float(9.0) * l_223;
const float l_228 = floor(l_227);
const float l_229 = l_228 * l_143;
const float l_230 = l_226 + l_229;
const float l_231 = float(27.0) * l_223;
const float l_232 = floor(l_231);
const float l_233 = l_232 * l_145;
const float l_234 = l_230 + l_233;
const float l_235 = float(81.0) * l_223;
const float l_236 = floor(l_235);
const float l_237 = l_236 * l_147;
const float l_238 = l_234 + l_237;
const float l_239 = float(243.0) * l_223;
const float l_240 = floor(l_239);
const float l_241 = l_240 * l_104;
const float l_242 = l_238 + l_241;
const float l_243 = l_221 + l_242;
const float l_244 = l_178 * l_108;
const float l_245 = l_243 + l_244;
const float l_246 = l_245 - l_123;
const float l_247 = l_170 * l_246;
const float l_248 = l_arr_14[uint(0)];
const float l_249 = l_248 + l_247;
l_arr_14[uint(0)] = l_249;
const uint l_250 = uint(1) * l_15;
l_mut_149 = l_250;
const bool l_251 = uint(1) > l_mut_16;
if (l_251) {
l_mut_149 = l_20;
}
const uint l_252 = l_mut_39 + l_mut_149;
const uint l_253 = l_252 + l_25;
const uint l_254 = buffer_0[l_253];
const uint l_255 = l_254 >> l_27;
const uint l_256 = l_255 & uint(255);
const uint l_257 = l_254 >> l_28;
const uint l_258 = l_257 & uint(255);
const uint l_259 = l_252 + l_30;
const uint l_260 = buffer_0[l_259];
const uint l_261 = l_260 >> l_32;
const uint l_262 = l_261 & uint(255);
const uint l_263 = l_252 + uint(6);
const uint l_264 = buffer_0[l_263];
const uint l_265 = l_264 >> l_34;
const uint l_266 = l_265 & uint(255);
const uint l_267 = l_264 >> uint(16);
const uint l_268 = l_267 & uint(65535);
const half_2 l_269 = reinterpret_cast<thread half_2 const&>(l_268);
const half l_270 = l_269.i_0;
const float l_271 = float(l_270);
const float l_272 = float(l_266);
const float l_273 = l_272 * float(0.00390625);
const float l_274 = l_13 * l_273;
const float l_275 = floor(l_274);
const float l_276 = l_mut_9 * l_273;
const float l_277 = floor(l_276);
const float l_278 = float(3.0) * l_277;
const float l_279 = l_275 - l_278;
const float l_280 = float(l_256);
const float l_281 = l_280 * float(0.00390625);
const float l_282 = float(3.0) * l_281;
const float l_283 = floor(l_282);
const float l_284 = l_283 * l_125;
const float l_285 = float(9.0) * l_281;
const float l_286 = floor(l_285);
const float l_287 = l_286 * l_127;
const float l_288 = l_284 + l_287;
const float l_289 = float(27.0) * l_281;
const float l_290 = floor(l_289);
const float l_291 = l_290 * l_129;
const float l_292 = l_288 + l_291;
const float l_293 = float(81.0) * l_281;
const float l_294 = floor(l_293);
const float l_295 = l_294 * l_131;
const float l_296 = l_292 + l_295;
const float l_297 = float(243.0) * l_281;
const float l_298 = floor(l_297);
const float l_299 = l_298 * l_60;
const float l_300 = l_296 + l_299;
const float l_301 = float(l_258);
const float l_302 = l_301 * float(0.00390625);
const float l_303 = float(3.0) * l_302;
const float l_304 = floor(l_303);
const float l_305 = l_304 * l_133;
const float l_306 = float(9.0) * l_302;
const float l_307 = floor(l_306);
const float l_308 = l_307 * l_135;
const float l_309 = l_305 + l_308;
const float l_310 = float(27.0) * l_302;
const float l_311 = floor(l_310);
const float l_312 = l_311 * l_137;
const float l_313 = l_309 + l_312;
const float l_314 = float(81.0) * l_302;
const float l_315 = floor(l_314);
const float l_316 = l_315 * l_139;
const float l_317 = l_313 + l_316;
const float l_318 = float(243.0) * l_302;
const float l_319 = floor(l_318);
const float l_320 = l_319 * l_84;
const float l_321 = l_317 + l_320;
const float l_322 = l_300 + l_321;
const float l_323 = float(l_262);
const float l_324 = l_323 * float(0.00390625);
const float l_325 = float(3.0) * l_324;
const float l_326 = floor(l_325);
const float l_327 = l_326 * l_141;
const float l_328 = float(9.0) * l_324;
const float l_329 = floor(l_328);
const float l_330 = l_329 * l_143;
const float l_331 = l_327 + l_330;
const float l_332 = float(27.0) * l_324;
const float l_333 = floor(l_332);
const float l_334 = l_333 * l_145;
const float l_335 = l_331 + l_334;
const float l_336 = float(81.0) * l_324;
const float l_337 = floor(l_336);
const float l_338 = l_337 * l_147;
const float l_339 = l_335 + l_338;
const float l_340 = float(243.0) * l_324;
const float l_341 = floor(l_340);
const float l_342 = l_341 * l_104;
const float l_343 = l_339 + l_342;
const float l_344 = l_322 + l_343;
const float l_345 = l_279 * l_108;
const float l_346 = l_344 + l_345;
const float l_347 = l_346 - l_123;
const float l_348 = l_271 * l_347;
const float l_349 = l_arr_14[uint(1)];
const float l_350 = l_349 + l_348;
l_arr_14[uint(1)] = l_350;
l_mut_36 = l_mut_36 + uint(4);
l_mut_38 = l_mut_38 + uint(512);
l_mut_39 = l_mut_39 + uint(28);
}
}
const float l_351 = l_arr_14[uint(0)];
const float l_352 = float {simd_sum(l_351)
};
const bool l_353 = thread_pos_in_threadgroup.x == uint(0);
const uint l_354 = l_5 + uint(0);
const bool l_355 = l_354 < l_1;
const bool l_356 = l_353 && l_355;
if (l_356) {
const uint l_357 = l_5 + uint(0);
const bfloat l_358 = bfloat(l_352);
buffer_2[l_357] = l_358;
}
const float l_359 = l_arr_14[uint(1)];
const float l_360 = float {simd_sum(l_359)
};
const bool l_361 = thread_pos_in_threadgroup.x == uint(0);
const uint l_362 = l_5 + uint(1);
const bool l_363 = l_362 < l_1;
const bool l_364 = l_361 && l_363;
if (l_364) {
const uint l_365 = l_5 + uint(1);
const bfloat l_366 = bfloat(l_360);
buffer_2[l_365] = l_366;
}

}
