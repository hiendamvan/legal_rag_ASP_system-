% =========================
% Điều 6 - Khoản 1
% =========================

rule(d6_k1_a).
rule_type(d6_k1_a, primary_violation).
article(d6_k1_a, 6).
clause(d6_k1_a, 1).
point(d6_k1_a, "a").
subject(d6_k1_a, car).
action(d6_k1_a, disobey_traffic_sign_or_marking).
context(d6_k1_a, []).
exception(d6_k1_a, reference_other_clauses_k2_k3_k4_k5_k6_k7_k9_k10_k11).
fine_min(d6_k1_a, 400000).
fine_max(d6_k1_a, 600000).
original_vi_text(d6_k1_a, "Không chấp hành hiệu lệnh, chỉ dẫn của biển báo hiệu, vạch kẻ đường...").

rule(d6_k1_b).
rule_type(d6_k1_b, primary_violation).
article(d6_k1_b, 6).
clause(d6_k1_b, 1).
point(d6_k1_b, "b").
subject(d6_k1_b, car).
action(d6_k1_b, no_signal_when_entering_or_leaving_stop).
context(d6_k1_b, []).
exception(d6_k1_b, []).
fine_min(d6_k1_b, 400000).
fine_max(d6_k1_b, 600000).
original_vi_text(d6_k1_b, "Không có tín hiệu khi ra, vào vị trí dừng xe, đỗ xe.").

rule(d6_k1_c).
rule_type(d6_k1_c, primary_violation).
article(d6_k1_c, 6).
clause(d6_k1_c, 1).
point(d6_k1_c, "c").
subject(d6_k1_c, car).
action(d6_k1_c, no_emergency_warning_when_breakdown).
context(d6_k1_c, [vehicle_breakdown]).
exception(d6_k1_c, violation_d6_k7_c).
fine_min(d6_k1_c, 400000).
fine_max(d6_k1_c, 600000).
original_vi_text(d6_k1_c, "Không báo hiệu bằng đèn khẩn cấp...").

rule(d6_k1_d_1).
rule_type(d6_k1_d_1, primary_violation).
article(d6_k1_d_1, 6).
clause(d6_k1_d_1, 1).
point(d6_k1_d_1, "d").
subject(d6_k1_d_1, car).
action(d6_k1_d_1, no_sign_on_towing_vehicle_front).
context(d6_k1_d_1, [towing_vehicle]).
exception(d6_k1_d_1, []).
fine_min(d6_k1_d_1, 400000).
fine_max(d6_k1_d_1, 600000).
original_vi_text(d6_k1_d_1, "Không gắn biển phía trước xe kéo.").

rule(d6_k1_d_2).
rule_type(d6_k1_d_2, primary_violation).
article(d6_k1_d_2, 6).
clause(d6_k1_d_2, 1).
point(d6_k1_d_2, "d").
subject(d6_k1_d_2, car).
action(d6_k1_d_2, towing_without_required_sign).
context(d6_k1_d_2, [towing_vehicle]).
exception(d6_k1_d_2, []).
fine_min(d6_k1_d_2, 400000).
fine_max(d6_k1_d_2, 600000).
original_vi_text(d6_k1_d_2, "Xe kéo rơ moóc không có biển báo.").

rule(d6_k1_dd).
rule_type(d6_k1_dd, primary_violation).
article(d6_k1_dd, 6).
clause(d6_k1_dd, 1).
point(d6_k1_dd, "đ").
subject(d6_k1_dd, car).
action(d6_k1_dd, use_horn_at_night_in_restricted_area).
context(d6_k1_dd, [time_22h_to_5h, residential_or_hospital_area]).
exception(d6_k1_dd, priority_vehicle_on_emergency_duty).
fine_min(d6_k1_dd, 400000).
fine_max(d6_k1_dd, 600000).
original_vi_text(d6_k1_dd, "Sử dụng còi từ 22h đến 5h...").


% =========================
% Điều 6 - Khoản 2
% =========================

rule(d6_k2_a).
rule_type(d6_k2_a, primary_violation).
article(d6_k2_a, 6).
clause(d6_k2_a, 2).
point(d6_k2_a, "a").
subject(d6_k2_a, car).
action(d6_k2_a, illegal_lane_change).
context(d6_k2_a, [lane_change]).
exception(d6_k2_a, violation_d6_k5_g).
fine_min(d6_k2_a, 600000).
fine_max(d6_k2_a, 800000).
original_vi_text(d6_k2_a, "Chuyển làn không đúng quy định...").

rule(d6_k2_b).
rule_type(d6_k2_b, primary_violation).
article(d6_k2_b, 6).
clause(d6_k2_b, 2).
point(d6_k2_b, "b").
subject(d6_k2_b, car).
action(d6_k2_b, carry_excess_passengers_in_cabin).
context(d6_k2_b, []).
exception(d6_k2_b, []).
fine_min(d6_k2_b, 600000).
fine_max(d6_k2_b, 800000).
original_vi_text(d6_k2_b, "Chở người quá số lượng quy định.").

rule(d6_k2_c).
rule_type(d6_k2_c, primary_violation).
article(d6_k2_c, 6).
clause(d6_k2_c, 2).
point(d6_k2_c, "c").
subject(d6_k2_c, car).
action(d6_k2_c, not_yielding_at_intersection).
context(d6_k2_c, [intersection]).
exception(d6_k2_c, violation_d6_k5_n_o).
fine_min(d6_k2_c, 600000).
fine_max(d6_k2_c, 800000).
original_vi_text(d6_k2_c, "Không nhường đường tại nơi giao nhau.").

rule(d6_k2_d_1).
rule_type(d6_k2_d_1, primary_violation).
article(d6_k2_d_1, 6).
clause(d6_k2_d_1, 2).
point(d6_k2_d_1, "d").
subject(d6_k2_d_1, car).
action(d6_k2_d_1, stop_on_road_when_shoulder_available).
context(d6_k2_d_1, [outside_urban_area]).
exception(d6_k2_d_1, []).
fine_min(d6_k2_d_1, 600000).
fine_max(d6_k2_d_1, 800000).
original_vi_text(d6_k2_d_1, "Dừng xe trên phần đường khi có lề đường rộng.").

rule(d6_k2_d_2).
rule_type(d6_k2_d_2, primary_violation).
article(d6_k2_d_2, 6).
clause(d6_k2_d_2, 2).
point(d6_k2_d_2, "d").
subject(d6_k2_d_2, car).
action(d6_k2_d_2, parking_wrong_direction).
context(d6_k2_d_2, []).
exception(d6_k2_d_2, []).
fine_min(d6_k2_d_2, 600000).
fine_max(d6_k2_d_2, 800000).
original_vi_text(d6_k2_d_2, "Đỗ xe ngược chiều lưu thông.").

rule(d6_k2_d_3).
rule_type(d6_k2_d_3, primary_violation).
article(d6_k2_d_3, 6).
clause(d6_k2_d_3, 2).
point(d6_k2_d_3, "d").
subject(d6_k2_d_3, car).
action(d6_k2_d_3, parking_on_median).
context(d6_k2_d_3, []).
exception(d6_k2_d_3, []).
fine_min(d6_k2_d_3, 600000).
fine_max(d6_k2_d_3, 800000).
original_vi_text(d6_k2_d_3, "Đỗ xe trên dải phân cách.").

rule(d6_k2_d_4).
rule_type(d6_k2_d_4, primary_violation).
article(d6_k2_d_4, 6).
clause(d6_k2_d_4, 2).
point(d6_k2_d_4, "d").
subject(d6_k2_d_4, car).
action(d6_k2_d_4, parking_on_slope_without_block).
context(d6_k2_d_4, [slope]).
exception(d6_k2_d_4, []).
fine_min(d6_k2_d_4, 600000).
fine_max(d6_k2_d_4, 800000).
original_vi_text(d6_k2_d_4, "Đỗ xe trên dốc không chèn bánh.").

rule(d6_k2_dd_1).
rule_type(d6_k2_dd_1, primary_violation).
article(d6_k2_dd_1, 6).
clause(d6_k2_dd_1, 2).
point(d6_k2_dd_1, "đ").
subject(d6_k2_dd_1, car).
action(d6_k2_dd_1, stop_not_close_to_right_edge).
context(d6_k2_dd_1, []).
exception(d6_k2_dd_1, []).
fine_min(d6_k2_dd_1, 600000).
fine_max(d6_k2_dd_1, 800000).
original_vi_text(d6_k2_dd_1, "Dừng xe không sát lề đường.").

rule(d6_k2_dd_2).
rule_type(d6_k2_dd_2, primary_violation).
article(d6_k2_dd_2, 6).
clause(d6_k2_dd_2, 2).
point(d6_k2_dd_2, "đ").
subject(d6_k2_dd_2, car).
action(d6_k2_dd_2, stop_on_bus_lane).
context(d6_k2_dd_2, []).
exception(d6_k2_dd_2, []).
fine_min(d6_k2_dd_2, 600000).
fine_max(d6_k2_dd_2, 800000).
original_vi_text(d6_k2_dd_2, "Dừng xe trên làn xe buýt.").

rule(d6_k2_dd_3).
rule_type(d6_k2_dd_3, primary_violation).
article(d6_k2_dd_3, 6).
clause(d6_k2_dd_3, 2).
point(d6_k2_dd_3, "đ").
subject(d6_k2_dd_3, car).
action(d6_k2_dd_3, leave_driver_seat_without_safety).
context(d6_k2_dd_3, [vehicle_stopped]).
exception(d6_k2_dd_3, temporary_exit_for_loading_or_check).
fine_min(d6_k2_dd_3, 600000).
fine_max(d6_k2_dd_3, 800000).
original_vi_text(d6_k2_dd_3, "Rời vị trí lái không đảm bảo an toàn.").

% ============================================================
% Knowledge Base - Dieu 6, khoan 3 -> 16
% Fields:
% rule, rule_type, article, clause, point, subject, action,
% context, exception, fine_min, fine_max, original_vi_text
%
% NOTE:
% - context = real-world condition: when / where / situation / measurable condition
% - exception = exception condition in law
% - No trigger/dependency fields are used.
% - If no context/exception exists, the fact is omitted.
% ============================================================


% =========================
% Dieu 6 - Khoan 3
% Fine: 800000 - 1000000
% =========================

rule(d6_k3_a).
rule_type(d6_k3_a, primary_violation).
article(d6_k3_a, 6).
clause(d6_k3_a, 3).
point(d6_k3_a, "a").
subject(d6_k3_a, car).
action(d6_k3_a, speeding_excess_05_to_under_10_kmh).
context(d6_k3_a, speed_excess_05_to_under_10_kmh).
fine_min(d6_k3_a, 800000).
fine_max(d6_k3_a, 1000000).
original_vi_text(d6_k3_a, "Điều khiển xe chạy quá tốc độ quy định từ 05 km/h đến dưới 10 km/h.").

rule(d6_k3_b_1).
rule_type(d6_k3_b_1, primary_violation).
article(d6_k3_b_1, 6).
clause(d6_k3_b_1, 3).
point(d6_k3_b_1, "b").
subject(d6_k3_b_1, car).
action(d6_k3_b_1, continuous_horn_or_engine_revving).
fine_min(d6_k3_b_1, 800000).
fine_max(d6_k3_b_1, 1000000).
original_vi_text(d6_k3_b_1, "Sử dụng còi, rú ga liên tục.").

rule(d6_k3_b_2).
rule_type(d6_k3_b_2, primary_violation).
article(d6_k3_b_2, 6).
clause(d6_k3_b_2, 3).
point(d6_k3_b_2, "b").
subject(d6_k3_b_2, car).
action(d6_k3_b_2, use_air_horn).
exception(d6_k3_b_2, priority_vehicle_on_duty).
fine_min(d6_k3_b_2, 800000).
fine_max(d6_k3_b_2, 1000000).
original_vi_text(d6_k3_b_2, "Sử dụng còi hơi, trừ các xe ưu tiên đang đi làm nhiệm vụ theo quy định.").

rule(d6_k3_b_3).
rule_type(d6_k3_b_3, primary_violation).
article(d6_k3_b_3, 6).
clause(d6_k3_b_3, 3).
point(d6_k3_b_3, "b").
subject(d6_k3_b_3, car).
action(d6_k3_b_3, use_high_beam_when_meeting_pedestrian).
context(d6_k3_b_3, pedestrian_crossing).
exception(d6_k3_b_3, priority_vehicle_on_duty).
fine_min(d6_k3_b_3, 800000).
fine_max(d6_k3_b_3, 1000000).
original_vi_text(d6_k3_b_3, "Sử dụng đèn chiếu xa khi gặp người đi bộ qua đường, trừ các xe ưu tiên đang đi làm nhiệm vụ theo quy định.").

rule(d6_k3_b_4).
rule_type(d6_k3_b_4, primary_violation).
article(d6_k3_b_4, 6).
clause(d6_k3_b_4, 3).
point(d6_k3_b_4, "b").
subject(d6_k3_b_4, car).
action(d6_k3_b_4, use_high_beam_in_residential_area_with_lighting).
context(d6_k3_b_4, residential_area).
context(d6_k3_b_4, lighting_system_active).
exception(d6_k3_b_4, priority_vehicle_on_duty).
fine_min(d6_k3_b_4, 800000).
fine_max(d6_k3_b_4, 1000000).
original_vi_text(d6_k3_b_4, "Sử dụng đèn chiếu xa khi đi trên đoạn đường qua khu dân cư có hệ thống chiếu sáng đang hoạt động, trừ các xe ưu tiên đang đi làm nhiệm vụ theo quy định.").

rule(d6_k3_b_5).
rule_type(d6_k3_b_5, primary_violation).
article(d6_k3_b_5, 6).
clause(d6_k3_b_5, 3).
point(d6_k3_b_5, "b").
subject(d6_k3_b_5, car).
action(d6_k3_b_5, use_high_beam_when_meeting_opposite_vehicle).
context(d6_k3_b_5, opposite_vehicle).
exception(d6_k3_b_5, anti_glare_median).
exception(d6_k3_b_5, priority_vehicle_on_duty).
fine_min(d6_k3_b_5, 800000).
fine_max(d6_k3_b_5, 1000000).
original_vi_text(d6_k3_b_5, "Sử dụng đèn chiếu xa khi gặp xe đi ngược chiều, trừ trường hợp dải phân cách có khả năng chống chói hoặc xe ưu tiên đang đi làm nhiệm vụ theo quy định.").

rule(d6_k3_b_6).
rule_type(d6_k3_b_6, primary_violation).
article(d6_k3_b_6, 6).
clause(d6_k3_b_6, 3).
point(d6_k3_b_6, "b").
subject(d6_k3_b_6, car).
action(d6_k3_b_6, use_high_beam_when_turning_at_intersection).
context(d6_k3_b_6, turning).
context(d6_k3_b_6, intersection).
exception(d6_k3_b_6, priority_vehicle_on_duty).
fine_min(d6_k3_b_6, 800000).
fine_max(d6_k3_b_6, 1000000).
original_vi_text(d6_k3_b_6, "Sử dụng đèn chiếu xa khi chuyển hướng xe tại nơi đường giao nhau, trừ các xe ưu tiên đang đi làm nhiệm vụ theo quy định.").

rule(d6_k3_c_1).
rule_type(d6_k3_c_1, primary_violation).
article(d6_k3_c_1, 6).
clause(d6_k3_c_1, 3).
point(d6_k3_c_1, "c").
subject(d6_k3_c_1, car).
action(d6_k3_c_1, turning_without_observation).
context(d6_k3_c_1, turning).
exception(d6_k3_c_1, curved_road_without_same_level_intersection).
fine_min(d6_k3_c_1, 800000).
fine_max(d6_k3_c_1, 1000000).
original_vi_text(d6_k3_c_1, "Chuyển hướng không quan sát, trừ trường hợp điều khiển xe đi theo hướng cong của đoạn đường bộ ở nơi đường không giao nhau cùng mức.").

rule(d6_k3_c_2).
rule_type(d6_k3_c_2, primary_violation).
article(d6_k3_c_2, 6).
clause(d6_k3_c_2, 3).
point(d6_k3_c_2, "c").
subject(d6_k3_c_2, car).
action(d6_k3_c_2, turning_without_safe_distance_from_rear_vehicle).
context(d6_k3_c_2, turning).
context(d6_k3_c_2, rear_vehicle).
exception(d6_k3_c_2, curved_road_without_same_level_intersection).
fine_min(d6_k3_c_2, 800000).
fine_max(d6_k3_c_2, 1000000).
original_vi_text(d6_k3_c_2, "Chuyển hướng không bảo đảm khoảng cách an toàn với xe phía sau, trừ trường hợp điều khiển xe đi theo hướng cong của đoạn đường bộ ở nơi đường không giao nhau cùng mức.").

rule(d6_k3_c_3).
rule_type(d6_k3_c_3, primary_violation).
article(d6_k3_c_3, 6).
clause(d6_k3_c_3, 3).
point(d6_k3_c_3, "c").
subject(d6_k3_c_3, car).
action(d6_k3_c_3, turning_without_slowing_down).
context(d6_k3_c_3, turning).
exception(d6_k3_c_3, curved_road_without_same_level_intersection).
fine_min(d6_k3_c_3, 800000).
fine_max(d6_k3_c_3, 1000000).
original_vi_text(d6_k3_c_3, "Chuyển hướng không giảm tốc độ, trừ trường hợp điều khiển xe đi theo hướng cong của đoạn đường bộ ở nơi đường không giao nhau cùng mức.").

rule(d6_k3_c_4).
rule_type(d6_k3_c_4, primary_violation).
article(d6_k3_c_4, 6).
clause(d6_k3_c_4, 3).
point(d6_k3_c_4, "c").
subject(d6_k3_c_4, car).
action(d6_k3_c_4, turning_without_turn_signal).
context(d6_k3_c_4, turning).
exception(d6_k3_c_4, curved_road_without_same_level_intersection).
fine_min(d6_k3_c_4, 800000).
fine_max(d6_k3_c_4, 1000000).
original_vi_text(d6_k3_c_4, "Chuyển hướng không có tín hiệu báo hướng rẽ, trừ trường hợp điều khiển xe đi theo hướng cong của đoạn đường bộ ở nơi đường không giao nhau cùng mức.").

rule(d6_k3_c_5).
rule_type(d6_k3_c_5, primary_violation).
article(d6_k3_c_5, 6).
clause(d6_k3_c_5, 3).
point(d6_k3_c_5, "c").
subject(d6_k3_c_5, car).
action(d6_k3_c_5, turn_signal_not_used_continuously_when_turning).
context(d6_k3_c_5, turning).
context(d6_k3_c_5, turn_signal_on).
exception(d6_k3_c_5, curved_road_without_same_level_intersection).
fine_min(d6_k3_c_5, 800000).
fine_max(d6_k3_c_5, 1000000).
original_vi_text(d6_k3_c_5, "Có tín hiệu báo hướng rẽ nhưng không sử dụng liên tục trong quá trình chuyển hướng, trừ trường hợp điều khiển xe đi theo hướng cong của đoạn đường bộ ở nơi đường không giao nhau cùng mức.").

rule(d6_k3_d_1).
rule_type(d6_k3_d_1, primary_violation).
article(d6_k3_d_1, 6).
clause(d6_k3_d_1, 3).
point(d6_k3_d_1, "d").
subject(d6_k3_d_1, car).
action(d6_k3_d_1, improper_stop_or_parking_at_railway_crossing).
context(d6_k3_d_1, railway_crossing).
fine_min(d6_k3_d_1, 800000).
fine_max(d6_k3_d_1, 1000000).
original_vi_text(d6_k3_d_1, "Không tuân thủ các quy định về dừng xe, đỗ xe tại nơi đường bộ giao nhau cùng mức với đường sắt.").

rule(d6_k3_d_2).
rule_type(d6_k3_d_2, primary_violation).
article(d6_k3_d_2, 6).
clause(d6_k3_d_2, 3).
point(d6_k3_d_2, "d").
subject(d6_k3_d_2, car).
action(d6_k3_d_2, stop_or_parking_within_railway_safety_area).
context(d6_k3_d_2, railway_protection_area).
context(d6_k3_d_2, railway_safety_area).
fine_min(d6_k3_d_2, 800000).
fine_max(d6_k3_d_2, 1000000).
original_vi_text(d6_k3_d_2, "Dừng xe, đỗ xe trong phạm vi bảo vệ công trình đường sắt, phạm vi an toàn của đường sắt.").

rule(d6_k3_dd_1).
rule_type(d6_k3_dd_1, primary_violation).
article(d6_k3_dd_1, 6).
clause(d6_k3_dd_1, 3).
point(d6_k3_dd_1, "đ").
subject(d6_k3_dd_1, car).
action(d6_k3_dd_1, stop_or_parking_at_intersection_or_within_5m).
context(d6_k3_dd_1, intersection).
context(d6_k3_dd_1, within_5m_from_intersection_edge).
fine_min(d6_k3_dd_1, 800000).
fine_max(d6_k3_dd_1, 1000000).
original_vi_text(d6_k3_dd_1, "Dừng xe, đỗ xe tại nơi đường bộ giao nhau hoặc trong phạm vi 05 mét tính từ mép đường giao nhau.").

rule(d6_k3_dd_2).
rule_type(d6_k3_dd_2, primary_violation).
article(d6_k3_dd_2, 6).
clause(d6_k3_dd_2, 3).
point(d6_k3_dd_2, "đ").
subject(d6_k3_dd_2, car).
action(d6_k3_dd_2, stop_or_parking_at_passenger_pickup_dropoff_point).
context(d6_k3_dd_2, passenger_pickup_dropoff_point).
fine_min(d6_k3_dd_2, 800000).
fine_max(d6_k3_dd_2, 1000000).
original_vi_text(d6_k3_dd_2, "Dừng xe, đỗ xe tại điểm đón, trả khách.").

rule(d6_k3_dd_3).
rule_type(d6_k3_dd_3, primary_violation).
article(d6_k3_dd_3, 6).
clause(d6_k3_dd_3, 3).
point(d6_k3_dd_3, "đ").
subject(d6_k3_dd_3, car).
action(d6_k3_dd_3, stop_or_parking_near_agency_gate).
context(d6_k3_dd_3, agency_or_organization_gate).
context(d6_k3_dd_3, within_5m_from_gate).
fine_min(d6_k3_dd_3, 800000).
fine_max(d6_k3_dd_3, 1000000).
original_vi_text(d6_k3_dd_3, "Dừng xe, đỗ xe trước cổng hoặc trong phạm vi 05 mét hai bên cổng trụ sở cơ quan, tổ chức có bố trí đường cho xe ra, vào.").

rule(d6_k3_dd_4).
rule_type(d6_k3_dd_4, primary_violation).
article(d6_k3_dd_4, 6).
clause(d6_k3_dd_4, 3).
point(d6_k3_dd_4, "đ").
subject(d6_k3_dd_4, car).
action(d6_k3_dd_4, stop_or_parking_on_one_lane_width_road).
context(d6_k3_dd_4, road_width_only_one_motor_vehicle_lane).
fine_min(d6_k3_dd_4, 800000).
fine_max(d6_k3_dd_4, 1000000).
original_vi_text(d6_k3_dd_4, "Dừng xe, đỗ xe tại nơi phần đường có bề rộng chỉ đủ cho một làn xe cơ giới.").

rule(d6_k3_dd_5).
rule_type(d6_k3_dd_5, primary_violation).
article(d6_k3_dd_5, 6).
clause(d6_k3_dd_5, 3).
point(d6_k3_dd_5, "đ").
subject(d6_k3_dd_5, car).
action(d6_k3_dd_5, stop_or_parking_obstructing_traffic_sign_or_light).
context(d6_k3_dd_5, obstructing_traffic_sign).
context(d6_k3_dd_5, obstructing_traffic_light).
fine_min(d6_k3_dd_5, 800000).
fine_max(d6_k3_dd_5, 1000000).
original_vi_text(d6_k3_dd_5, "Dừng xe, đỗ xe che khuất biển báo hiệu đường bộ, đèn tín hiệu giao thông.").

rule(d6_k3_dd_6).
rule_type(d6_k3_dd_6, primary_violation).
article(d6_k3_dd_6, 6).
clause(d6_k3_dd_6, 3).
point(d6_k3_dd_6, "đ").
subject(d6_k3_dd_6, car).
action(d6_k3_dd_6, stop_or_parking_at_median_opening).
context(d6_k3_dd_6, median_opening).
fine_min(d6_k3_dd_6, 800000).
fine_max(d6_k3_dd_6, 1000000).
original_vi_text(d6_k3_dd_6, "Dừng xe, đỗ xe tại nơi mở dải phân cách giữa.").

rule(d6_k3_dd_7).
rule_type(d6_k3_dd_7, primary_violation).
article(d6_k3_dd_7, 6).
clause(d6_k3_dd_7, 3).
point(d6_k3_dd_7, "đ").
subject(d6_k3_dd_7, car).
action(d6_k3_dd_7, stop_or_parking_too_close_to_opposite_parked_car).
context(d6_k3_dd_7, narrow_street_or_one_lane_road).
fine_min(d6_k3_dd_7, 800000).
fine_max(d6_k3_dd_7, 1000000).
original_vi_text(d6_k3_dd_7, "Dừng xe, đỗ xe cách xe ô tô đang đỗ ngược chiều dưới 20 mét trên đường phố hẹp hoặc dưới 40 mét trên đường có một làn xe cơ giới trên một chiều đường.").

rule(d6_k3_e_1).
rule_type(d6_k3_e_1, primary_violation).
article(d6_k3_e_1, 6).
clause(d6_k3_e_1, 3).
point(d6_k3_e_1, "e").
subject(d6_k3_e_1, car).
action(d6_k3_e_1, parking_not_close_to_right_edge).
context(d6_k3_e_1, parking).
exception(d6_k3_e_1, violation_d6_k4_dd).
exception(d6_k3_e_1, violation_d6_k7_c).
fine_min(d6_k3_e_1, 800000).
fine_max(d6_k3_e_1, 1000000).
original_vi_text(d6_k3_e_1, "Đỗ xe không sát theo lề đường, vỉa hè phía bên phải theo chiều đi hoặc bánh xe gần nhất cách lề đường, vỉa hè quá 0,25 mét, trừ hành vi vi phạm quy định tại điểm đ khoản 4, điểm c khoản 7 Điều này.").

rule(d6_k3_e_2).
rule_type(d6_k3_e_2, primary_violation).
article(d6_k3_e_2, 6).
clause(d6_k3_e_2, 3).
point(d6_k3_e_2, "e").
subject(d6_k3_e_2, car).
action(d6_k3_e_2, parking_on_bus_lane).
context(d6_k3_e_2, bus_lane).
exception(d6_k3_e_2, violation_d6_k4_dd).
exception(d6_k3_e_2, violation_d6_k7_c).
fine_min(d6_k3_e_2, 800000).
fine_max(d6_k3_e_2, 1000000).
original_vi_text(d6_k3_e_2, "Đỗ xe trên đường dành riêng cho xe buýt, trừ hành vi vi phạm quy định tại điểm đ khoản 4, điểm c khoản 7 Điều này.").

rule(d6_k3_e_3).
rule_type(d6_k3_e_3, primary_violation).
article(d6_k3_e_3, 6).
clause(d6_k3_e_3, 3).
point(d6_k3_e_3, "e").
subject(d6_k3_e_3, car).
action(d6_k3_e_3, parking_on_drain_or_utility_manhole_or_fire_water_place).
context(d6_k3_e_3, drain_or_utility_manhole_or_fire_water_place).
exception(d6_k3_e_3, violation_d6_k4_dd).
exception(d6_k3_e_3, violation_d6_k7_c).
fine_min(d6_k3_e_3, 800000).
fine_max(d6_k3_e_3, 1000000).
original_vi_text(d6_k3_e_3, "Đỗ xe trên miệng cống thoát nước, miệng hầm của đường điện thoại, điện cao thế, chỗ dành riêng cho xe chữa cháy lấy nước, trừ hành vi vi phạm quy định tại điểm đ khoản 4, điểm c khoản 7 Điều này.").

rule(d6_k3_e_4).
rule_type(d6_k3_e_4, primary_violation).
article(d6_k3_e_4, 6).
clause(d6_k3_e_4, 3).
point(d6_k3_e_4, "e").
subject(d6_k3_e_4, car).
action(d6_k3_e_4, parking_on_sidewalk_illegally).
context(d6_k3_e_4, sidewalk).
exception(d6_k3_e_4, violation_d6_k4_dd).
exception(d6_k3_e_4, violation_d6_k7_c).
fine_min(d6_k3_e_4, 800000).
fine_max(d6_k3_e_4, 1000000).
original_vi_text(d6_k3_e_4, "Đỗ, để xe ở vỉa hè trái quy định của pháp luật, trừ hành vi vi phạm quy định tại điểm đ khoản 4, điểm c khoản 7 Điều này.").

rule(d6_k3_e_5).
rule_type(d6_k3_e_5, primary_violation).
article(d6_k3_e_5, 6).
clause(d6_k3_e_5, 3).
point(d6_k3_e_5, "e").
subject(d6_k3_e_5, car).
action(d6_k3_e_5, parking_where_parking_or_stopping_parking_prohibited).
context(d6_k3_e_5, no_parking_sign).
context(d6_k3_e_5, no_stopping_and_parking_sign).
exception(d6_k3_e_5, violation_d6_k4_dd).
exception(d6_k3_e_5, violation_d6_k7_c).
fine_min(d6_k3_e_5, 800000).
fine_max(d6_k3_e_5, 1000000).
original_vi_text(d6_k3_e_5, "Đỗ xe nơi có biển Cấm đỗ xe hoặc biển Cấm dừng xe và đỗ xe, trừ hành vi vi phạm quy định tại điểm đ khoản 4, điểm c khoản 7 Điều này.").

rule(d6_k3_g).
rule_type(d6_k3_g, primary_violation).
article(d6_k3_g, 6).
clause(d6_k3_g, 3).
point(d6_k3_g, "g").
subject(d6_k3_g, car).
action(d6_k3_g, no_or_insufficient_lighting_when_required).
context(d6_k3_g, time_18h_to_06h).
context(d6_k3_g, limited_visibility_due_to_fog_smoke_dust_rain_or_bad_weather).
fine_min(d6_k3_g, 800000).
fine_max(d6_k3_g, 1000000).
original_vi_text(d6_k3_g, "Không sử dụng hoặc sử dụng không đủ đèn chiếu sáng trong thời gian từ 18 giờ ngày hôm trước đến 06 giờ ngày hôm sau hoặc khi có sương mù, khói, bụi, trời mưa, thời tiết xấu làm hạn chế tầm nhìn.").

rule(d6_k3_h_1).
rule_type(d6_k3_h_1, primary_violation).
article(d6_k3_h_1, 6).
clause(d6_k3_h_1, 3).
point(d6_k3_h_1, "h").
subject(d6_k3_h_1, car).
action(d6_k3_h_1, car_towing_other_vehicle_or_object_illegally).
context(d6_k3_h_1, towing_other_vehicle_or_object).
exception(d6_k3_h_1, towing_one_trailer_or_semi_trailer_or_disabled_vehicle_allowed).
fine_min(d6_k3_h_1, 800000).
fine_max(d6_k3_h_1, 1000000).
original_vi_text(d6_k3_h_1, "Điều khiển xe ô tô kéo theo xe khác, vật khác, trừ trường hợp kéo theo một rơ moóc, sơ mi rơ moóc hoặc một xe ô tô, xe máy chuyên dùng khác khi xe này không tự chạy được.").

rule(d6_k3_h_2).
rule_type(d6_k3_h_2, primary_violation).
article(d6_k3_h_2, 6).
clause(d6_k3_h_2, 3).
point(d6_k3_h_2, "h").
subject(d6_k3_h_2, car).
action(d6_k3_h_2, car_pushing_other_vehicle_or_object).
context(d6_k3_h_2, pushing_other_vehicle_or_object).
fine_min(d6_k3_h_2, 800000).
fine_max(d6_k3_h_2, 1000000).
original_vi_text(d6_k3_h_2, "Điều khiển xe ô tô đẩy xe khác, vật khác.").

rule(d6_k3_h_3).
rule_type(d6_k3_h_3, primary_violation).
article(d6_k3_h_3, 6).
clause(d6_k3_h_3, 3).
point(d6_k3_h_3, "h").
subject(d6_k3_h_3, car).
action(d6_k3_h_3, trailer_towing_additional_trailer_or_vehicle_or_object).
context(d6_k3_h_3, towing_vehicle_with_trailer_or_semi_trailer).
fine_min(d6_k3_h_3, 800000).
fine_max(d6_k3_h_3, 1000000).
original_vi_text(d6_k3_h_3, "Điều khiển xe kéo rơ moóc, sơ mi rơ moóc kéo thêm rơ moóc hoặc xe khác, vật khác.").

rule(d6_k3_h_4).
rule_type(d6_k3_h_4, primary_violation).
article(d6_k3_h_4, 6).
clause(d6_k3_h_4, 3).
point(d6_k3_h_4, "h").
subject(d6_k3_h_4, car).
action(d6_k3_h_4, unsafe_connection_between_towing_and_towed_vehicle).
context(d6_k3_h_4, towing).
fine_min(d6_k3_h_4, 800000).
fine_max(d6_k3_h_4, 1000000).
original_vi_text(d6_k3_h_4, "Không nối chắc chắn, an toàn giữa xe kéo và xe được kéo khi kéo nhau.").

rule(d6_k3_i).
rule_type(d6_k3_i, primary_violation).
article(d6_k3_i, 6).
clause(d6_k3_i, 3).
point(d6_k3_i, "i").
subject(d6_k3_i, car).
action(d6_k3_i, carrying_person_on_towed_vehicle).
context(d6_k3_i, towed_vehicle).
exception(d6_k3_i, driver_of_towed_vehicle).
fine_min(d6_k3_i, 800000).
fine_max(d6_k3_i, 1000000).
original_vi_text(d6_k3_i, "Chở người trên xe được kéo, trừ người điều khiển.").

rule(d6_k3_k).
rule_type(d6_k3_k, primary_violation).
article(d6_k3_k, 6).
clause(d6_k3_k, 3).
point(d6_k3_k, "k").
subject(d6_k3_k, car).
action(d6_k3_k, driver_not_wearing_seatbelt).
context(d6_k3_k, vehicle_running_on_road).
fine_min(d6_k3_k, 800000).
fine_max(d6_k3_k, 1000000).
original_vi_text(d6_k3_k, "Không thắt dây đai an toàn khi điều khiển xe chạy trên đường.").

rule(d6_k3_l).
rule_type(d6_k3_l, primary_violation).
article(d6_k3_l, 6).
clause(d6_k3_l, 3).
point(d6_k3_l, "l").
subject(d6_k3_l, car).
action(d6_k3_l, passenger_not_wearing_seatbelt).
context(d6_k3_l, vehicle_running).
context(d6_k3_l, seatbelt_equipped_position).
fine_min(d6_k3_l, 800000).
fine_max(d6_k3_l, 1000000).
original_vi_text(d6_k3_l, "Chở người trên xe ô tô không thắt dây đai an toàn tại vị trí có trang bị dây đai an toàn khi xe đang chạy.").

rule(d6_k3_m_1).
rule_type(d6_k3_m_1, primary_violation).
article(d6_k3_m_1, 6).
clause(d6_k3_m_1, 3).
point(d6_k3_m_1, "m").
subject(d6_k3_m_1, car).
action(d6_k3_m_1, child_under_10_and_under_135cm_sitting_same_row_as_driver).
context(d6_k3_m_1, child_under_10).
context(d6_k3_m_1, child_height_under_135cm).
exception(d6_k3_m_1, vehicle_with_only_one_seat_row).
fine_min(d6_k3_m_1, 800000).
fine_max(d6_k3_m_1, 1000000).
original_vi_text(d6_k3_m_1, "Chở trẻ em dưới 10 tuổi và chiều cao dưới 1,35 mét trên xe ô tô ngồi cùng hàng ghế với người lái xe, trừ loại xe ô tô chỉ có một hàng ghế.").

rule(d6_k3_m_2).
rule_type(d6_k3_m_2, primary_violation).
article(d6_k3_m_2, 6).
clause(d6_k3_m_2, 3).
point(d6_k3_m_2, "m").
subject(d6_k3_m_2, car).
action(d6_k3_m_2, no_child_safety_device).
context(d6_k3_m_2, child_passenger).
fine_min(d6_k3_m_2, 800000).
fine_max(d6_k3_m_2, 1000000).
original_vi_text(d6_k3_m_2, "Không sử dụng thiết bị an toàn phù hợp cho trẻ em theo quy định.").

rule(d6_k3_n).
rule_type(d6_k3_n, primary_violation).
article(d6_k3_n, 6).
clause(d6_k3_n, 3).
point(d6_k3_n, "n").
subject(d6_k3_n, car).
action(d6_k3_n, no_low_beam_in_tunnel).
context(d6_k3_n, road_tunnel).
fine_min(d6_k3_n, 800000).
fine_max(d6_k3_n, 1000000).
original_vi_text(d6_k3_n, "Chạy trong hầm đường bộ không sử dụng đèn chiếu sáng gần.").

rule(d6_k3_o).
rule_type(d6_k3_o, primary_violation).
article(d6_k3_o, 6).
clause(d6_k3_o, 3).
point(d6_k3_o, "o").
subject(d6_k3_o, car).
action(d6_k3_o, driving_below_minimum_speed).
context(d6_k3_o, road_with_minimum_speed).
fine_min(d6_k3_o, 800000).
fine_max(d6_k3_o, 1000000).
original_vi_text(d6_k3_o, "Điều khiển xe chạy dưới tốc độ tối thiểu trên đoạn đường bộ có quy định tốc độ tối thiểu cho phép.").

rule(d6_k3_p).
rule_type(d6_k3_p, primary_violation).
article(d6_k3_p, 6).
clause(d6_k3_p, 3).
point(d6_k3_p, "p").
subject(d6_k3_p, car).
action(d6_k3_p, slow_vehicle_not_keeping_right_lane).
context(d6_k3_p, slower_than_same_direction_vehicles).
exception(d6_k3_p, other_vehicles_are_speeding).
fine_min(d6_k3_p, 800000).
fine_max(d6_k3_p, 1000000).
original_vi_text(d6_k3_p, "Điều khiển xe chạy tốc độ thấp hơn các xe khác đi cùng chiều mà không đi về làn đường bên phải chiều đi của mình, trừ trường hợp các xe khác đi cùng chiều chạy quá tốc độ quy định.").


% =========================
% Dieu 6 - Khoan 4
% Fine: 2000000 - 3000000
% =========================

rule(d6_k4_a).
rule_type(d6_k4_a, primary_violation).
article(d6_k4_a, 6).
clause(d6_k4_a, 4).
point(d6_k4_a, "a").
subject(d6_k4_a, car).
action(d6_k4_a, vehicle_without_etc_tag_enters_etc_lane).
context(d6_k4_a, etc_lane).
fine_min(d6_k4_a, 2000000).
fine_max(d6_k4_a, 3000000).
original_vi_text(d6_k4_a, "Điều khiển xe không đủ điều kiện để thu phí theo hình thức điện tử tự động không dừng, xe không gắn thẻ đầu cuối, đi vào làn đường dành riêng thu phí điện tử tự động không dừng tại các trạm thu phí.").

rule(d6_k4_b_1).
rule_type(d6_k4_b_1, primary_violation).
article(d6_k4_b_1, 6).
clause(d6_k4_b_1, 4).
point(d6_k4_b_1, "b").
subject(d6_k4_b_1, car).
action(d6_k4_b_1, stop_or_parking_on_left_side_of_one_way_or_dual_carriageway).
context(d6_k4_b_1, one_way_road_or_dual_carriageway).
exception(d6_k4_b_1, violation_d6_k7_c).
fine_min(d6_k4_b_1, 2000000).
fine_max(d6_k4_b_1, 3000000).
original_vi_text(d6_k4_b_1, "Dừng xe, đỗ xe tại bên trái đường một chiều hoặc bên trái theo hướng lưu thông của đường đôi, trừ hành vi vi phạm quy định tại điểm c khoản 7 Điều này.").

rule(d6_k4_b_2).
rule_type(d6_k4_b_2, primary_violation).
article(d6_k4_b_2, 6).
clause(d6_k4_b_2, 4).
point(d6_k4_b_2, "b").
subject(d6_k4_b_2, car).
action(d6_k4_b_2, stop_or_parking_on_curve_or_near_slope_with_limited_visibility).
context(d6_k4_b_2, curve_or_near_slope).
context(d6_k4_b_2, limited_visibility).
exception(d6_k4_b_2, violation_d6_k7_c).
fine_min(d6_k4_b_2, 2000000).
fine_max(d6_k4_b_2, 3000000).
original_vi_text(d6_k4_b_2, "Dừng xe, đỗ xe trên đoạn đường cong hoặc gần đầu dốc nơi tầm nhìn bị che khuất, trừ hành vi vi phạm quy định tại điểm c khoản 7 Điều này.").

rule(d6_k4_b_3).
rule_type(d6_k4_b_3, primary_violation).
article(d6_k4_b_3, 6).
clause(d6_k4_b_3, 4).
point(d6_k4_b_3, "b").
subject(d6_k4_b_3, car).
action(d6_k4_b_3, stop_or_parking_on_bridge).
context(d6_k4_b_3, bridge).
exception(d6_k4_b_3, traffic_organization_allows_stop_or_parking_on_bridge).
exception(d6_k4_b_3, violation_d6_k7_c).
fine_min(d6_k4_b_3, 2000000).
fine_max(d6_k4_b_3, 3000000).
original_vi_text(d6_k4_b_3, "Dừng xe, đỗ xe trên cầu, trừ trường hợp tổ chức giao thông cho phép hoặc hành vi vi phạm quy định tại điểm c khoản 7 Điều này.").

rule(d6_k4_b_4).
rule_type(d6_k4_b_4, primary_violation).
article(d6_k4_b_4, 6).
clause(d6_k4_b_4, 4).
point(d6_k4_b_4, "b").
subject(d6_k4_b_4, car).
action(d6_k4_b_4, stop_or_parking_under_overpass).
context(d6_k4_b_4, under_overpass).
exception(d6_k4_b_4, allowed_stop_or_parking_under_overpass).
exception(d6_k4_b_4, violation_d6_k7_c).
fine_min(d6_k4_b_4, 2000000).
fine_max(d6_k4_b_4, 3000000).
original_vi_text(d6_k4_b_4, "Dừng xe, đỗ xe gầm cầu vượt, trừ những nơi cho phép dừng xe, đỗ xe hoặc hành vi vi phạm quy định tại điểm c khoản 7 Điều này.").

rule(d6_k4_b_5).
rule_type(d6_k4_b_5, primary_violation).
article(d6_k4_b_5, 6).
clause(d6_k4_b_5, 4).
point(d6_k4_b_5, "b").
subject(d6_k4_b_5, car).
action(d6_k4_b_5, stop_or_parking_parallel_with_another_stopped_or_parked_vehicle).
context(d6_k4_b_5, parallel_with_stopped_or_parked_vehicle).
exception(d6_k4_b_5, violation_d6_k7_c).
fine_min(d6_k4_b_5, 2000000).
fine_max(d6_k4_b_5, 3000000).
original_vi_text(d6_k4_b_5, "Dừng xe, đỗ xe song song với một xe khác đang dừng, đỗ, trừ hành vi vi phạm quy định tại điểm c khoản 7 Điều này.").

rule(d6_k4_c).
rule_type(d6_k4_c, primary_violation).
article(d6_k4_c, 6).
clause(d6_k4_c, 4).
point(d6_k4_c, "c").
subject(d6_k4_c, car).
action(d6_k4_c, no_safety_measure_when_broken_down_at_railway_crossing).
context(d6_k4_c, vehicle_breakdown).
context(d6_k4_c, railway_crossing).
fine_min(d6_k4_c, 2000000).
fine_max(d6_k4_c, 3000000).
original_vi_text(d6_k4_c, "Không thực hiện biện pháp bảo đảm an toàn theo quy định khi xe ô tô bị hư hỏng ngay tại nơi đường bộ giao nhau cùng mức với đường sắt.").

rule(d6_k4_d).
rule_type(d6_k4_d, primary_violation).
article(d6_k4_d, 6).
clause(d6_k4_d, 4).
point(d6_k4_d, "d").
subject(d6_k4_d, car).
action(d6_k4_d, not_yielding_to_overtaking_vehicle).
context(d6_k4_d, overtaking_vehicle).
context(d6_k4_d, safe_overtaking_condition).
fine_min(d6_k4_d, 2000000).
fine_max(d6_k4_d, 3000000).
original_vi_text(d6_k4_d, "Không nhường đường cho xe xin vượt khi có đủ điều kiện an toàn.").

rule(d6_k4_dd_1).
rule_type(d6_k4_dd_1, primary_violation).
article(d6_k4_dd_1, 6).
clause(d6_k4_dd_1, 4).
point(d6_k4_dd_1, "đ").
subject(d6_k4_dd_1, car).
action(d6_k4_dd_1, reverse_in_tunnel).
context(d6_k4_dd_1, road_tunnel).
fine_min(d6_k4_dd_1, 2000000).
fine_max(d6_k4_dd_1, 3000000).
original_vi_text(d6_k4_dd_1, "Lùi xe trong hầm đường bộ.").

rule(d6_k4_dd_2).
rule_type(d6_k4_dd_2, primary_violation).
article(d6_k4_dd_2, 6).
clause(d6_k4_dd_2, 4).
point(d6_k4_dd_2, "đ").
subject(d6_k4_dd_2, car).
action(d6_k4_dd_2, u_turn_in_tunnel).
context(d6_k4_dd_2, road_tunnel).
fine_min(d6_k4_dd_2, 2000000).
fine_max(d6_k4_dd_2, 3000000).
original_vi_text(d6_k4_dd_2, "Quay đầu xe trong hầm đường bộ.").

rule(d6_k4_dd_3).
rule_type(d6_k4_dd_3, primary_violation).
article(d6_k4_dd_3, 6).
clause(d6_k4_dd_3, 4).
point(d6_k4_dd_3, "đ").
subject(d6_k4_dd_3, car).
action(d6_k4_dd_3, stop_or_parking_in_tunnel_wrong_place).
context(d6_k4_dd_3, road_tunnel).
fine_min(d6_k4_dd_3, 2000000).
fine_max(d6_k4_dd_3, 3000000).
original_vi_text(d6_k4_dd_3, "Dừng xe, đỗ xe trong hầm đường bộ không đúng nơi quy định.").

rule(d6_k4_dd_4).
rule_type(d6_k4_dd_4, primary_violation).
article(d6_k4_dd_4, 6).
clause(d6_k4_dd_4, 4).
point(d6_k4_dd_4, "đ").
subject(d6_k4_dd_4, car).
action(d6_k4_dd_4, no_warning_when_forced_stop_in_tunnel).
context(d6_k4_dd_4, road_tunnel).
context(d6_k4_dd_4, vehicle_breakdown_or_force_majeure).
fine_min(d6_k4_dd_4, 2000000).
fine_max(d6_k4_dd_4, 3000000).
original_vi_text(d6_k4_dd_4, "Không có báo hiệu bằng đèn khẩn cấp, không đặt biển cảnh báo Chú ý xe đỗ hoặc đèn cảnh báo về phía sau xe khoảng cách đảm bảo an toàn khi buộc phải dừng xe, đỗ xe trong hầm đường bộ do sự cố kỹ thuật hoặc bất khả kháng.").

rule(d6_k4_e).
rule_type(d6_k4_e, primary_violation).
article(d6_k4_e, 6).
clause(d6_k4_e, 4).
point(d6_k4_e, "e").
subject(d6_k4_e, car).
action(d6_k4_e, illegal_reversing).
context(d6_k4_e, one_way_road_or_no_entry_road_or_no_stopping_area_or_crosswalk_or_intersection_or_railway_crossing_or_limited_visibility).
exception(d6_k4_e, violation_d6_k11_dd).
fine_min(d6_k4_e, 2000000).
fine_max(d6_k4_e, 3000000).
original_vi_text(d6_k4_e, "Lùi xe ở đường một chiều, đường có biển Cấm đi ngược chiều, khu vực cấm dừng, trên phần đường dành cho người đi bộ qua đường, nơi đường bộ giao nhau, nơi đường bộ giao nhau cùng mức với đường sắt, nơi tầm nhìn bị che khuất; lùi xe không quan sát hai bên, phía sau xe hoặc không có tín hiệu lùi xe, trừ hành vi tại điểm đ khoản 11 Điều này.").

rule(d6_k4_g).
rule_type(d6_k4_g, primary_violation).
article(d6_k4_g, 6).
clause(d6_k4_g, 4).
point(d6_k4_g, "g").
subject(d6_k4_g, car).
action(d6_k4_g, accident_related_vehicle_not_stop_or_help_victim).
context(d6_k4_g, directly_related_to_traffic_accident).
exception(d6_k4_g, violation_d6_k8).
fine_min(d6_k4_g, 2000000).
fine_max(d6_k4_g, 3000000).
original_vi_text(d6_k4_g, "Điều khiển xe có liên quan trực tiếp đến vụ tai nạn giao thông mà không dừng ngay phương tiện, không giữ nguyên hiện trường, không trợ giúp người bị nạn, trừ hành vi vi phạm quy định tại khoản 8 Điều này.").

rule(d6_k4_h).
rule_type(d6_k4_h, primary_violation).
article(d6_k4_h, 6).
clause(d6_k4_h, 4).
point(d6_k4_h, "h").
subject(d6_k4_h, car).
action(d6_k4_h, priority_vehicle_signal_device_violation).
context(d6_k4_h, priority_vehicle_signal_device).
fine_min(d6_k4_h, 2000000).
fine_max(d6_k4_h, 3000000).
original_vi_text(d6_k4_h, "Xe được quyền ưu tiên lắp đặt, sử dụng thiết bị phát tín hiệu ưu tiên không đúng quy định hoặc sử dụng thiết bị phát tín hiệu ưu tiên không có giấy phép hoặc giấy phép không còn giá trị sử dụng.").

rule(d6_k4_i).
rule_type(d6_k4_i, primary_violation).
article(d6_k4_i, 6).
clause(d6_k4_i, 4).
point(d6_k4_i, "i").
subject(d6_k4_i, car).
action(d6_k4_i, illegal_u_turn_at_restricted_location).
context(d6_k4_i, crosswalk_or_bridge_or_railway_crossing_or_narrow_road_or_slope_or_curve_or_one_way_road).
exception(d6_k4_i, traffic_controller_order).
exception(d6_k4_i, temporary_traffic_sign_instruction).
exception(d6_k4_i, traffic_organization_has_u_turn_place).
fine_min(d6_k4_i, 2000000).
fine_max(d6_k4_i, 3000000).
original_vi_text(d6_k4_i, "Quay đầu xe ở phần đường dành cho người đi bộ qua đường, trên cầu, đầu cầu, gầm cầu vượt, ngầm, tại nơi đường bộ giao nhau cùng mức với đường sắt, đường hẹp, đường dốc, đoạn đường cong tầm nhìn bị che khuất, trên đường một chiều, trừ khi có hiệu lệnh của người điều khiển giao thông hoặc chỉ dẫn của biển báo hiệu tạm thời hoặc tổ chức giao thông có bố trí nơi quay đầu xe.").

rule(d6_k4_k_1).
rule_type(d6_k4_k_1, primary_violation).
article(d6_k4_k_1, 6).
clause(d6_k4_k_1, 4).
point(d6_k4_k_1, "k").
subject(d6_k4_k_1, car).
action(d6_k4_k_1, u_turn_where_u_turn_prohibited).
context(d6_k4_k_1, u_turn_prohibited_sign).
fine_min(d6_k4_k_1, 2000000).
fine_max(d6_k4_k_1, 3000000).
original_vi_text(d6_k4_k_1, "Quay đầu xe tại nơi có biển báo hiệu có nội dung cấm quay đầu đối với loại phương tiện đang điều khiển.").

rule(d6_k4_k_2).
rule_type(d6_k4_k_2, primary_violation).
article(d6_k4_k_2, 6).
clause(d6_k4_k_2, 4).
point(d6_k4_k_2, "k").
subject(d6_k4_k_2, car).
action(d6_k4_k_2, turn_left_where_left_turn_prohibited).
context(d6_k4_k_2, left_turn_prohibited_sign).
fine_min(d6_k4_k_2, 2000000).
fine_max(d6_k4_k_2, 3000000).
original_vi_text(d6_k4_k_2, "Điều khiển xe rẽ trái tại nơi có biển báo hiệu có nội dung cấm rẽ trái đối với loại phương tiện đang điều khiển.").

rule(d6_k4_k_3).
rule_type(d6_k4_k_3, primary_violation).
article(d6_k4_k_3, 6).
clause(d6_k4_k_3, 4).
point(d6_k4_k_3, "k").
subject(d6_k4_k_3, car).
action(d6_k4_k_3, turn_right_where_right_turn_prohibited).
context(d6_k4_k_3, right_turn_prohibited_sign).
fine_min(d6_k4_k_3, 2000000).
fine_max(d6_k4_k_3, 3000000).
original_vi_text(d6_k4_k_3, "Điều khiển xe rẽ phải tại nơi có biển báo hiệu có nội dung cấm rẽ phải đối với loại phương tiện đang điều khiển.").

rule(d6_k4_l).
rule_type(d6_k4_l, primary_violation).
article(d6_k4_l, 6).
clause(d6_k4_l, 4).
point(d6_k4_l, "l").
subject(d6_k4_l, car).
action(d6_k4_l, unsafe_following_distance_causing_collision).
context(d6_k4_l, following_distance).
exception(d6_k4_l, violation_d6_k5_d).
fine_min(d6_k4_l, 2000000).
fine_max(d6_k4_l, 3000000).
original_vi_text(d6_k4_l, "Không giữ khoảng cách an toàn để xảy ra va chạm với xe chạy liền trước hoặc không giữ khoảng cách theo quy định của biển báo hiệu Cự ly tối thiểu giữa hai xe, trừ các hành vi vi phạm quy định tại điểm d khoản 5 Điều này.").


% =========================
% Dieu 6 - Khoan 5
% Fine: 4000000 - 6000000
% =========================

rule(d6_k5_a_1).
rule_type(d6_k5_a_1, primary_violation).
article(d6_k5_a_1, 6).
clause(d6_k5_a_1, 5).
point(d6_k5_a_1, "a").
subject(d6_k5_a_1, car).
action(d6_k5_a_1, overtaking_when_not_allowed).
context(d6_k5_a_1, overtaking).
fine_min(d6_k5_a_1, 4000000).
fine_max(d6_k5_a_1, 6000000).
original_vi_text(d6_k5_a_1, "Vượt xe trong những trường hợp không được vượt.").

rule(d6_k5_a_2).
rule_type(d6_k5_a_2, primary_violation).
article(d6_k5_a_2, 6).
clause(d6_k5_a_2, 5).
point(d6_k5_a_2, "a").
subject(d6_k5_a_2, car).
action(d6_k5_a_2, overtaking_where_overtaking_prohibited_sign).
context(d6_k5_a_2, no_overtaking_sign).
fine_min(d6_k5_a_2, 4000000).
fine_max(d6_k5_a_2, 6000000).
original_vi_text(d6_k5_a_2, "Vượt xe tại đoạn đường có biển báo hiệu có nội dung cấm vượt đối với loại phương tiện đang điều khiển.").

rule(d6_k5_a_3).
rule_type(d6_k5_a_3, primary_violation).
article(d6_k5_a_3, 6).
clause(d6_k5_a_3, 5).
point(d6_k5_a_3, "a").
subject(d6_k5_a_3, car).
action(d6_k5_a_3, overtaking_without_signal_or_not_using_signal_continuously).
context(d6_k5_a_3, overtaking).
fine_min(d6_k5_a_3, 4000000).
fine_max(d6_k5_a_3, 6000000).
original_vi_text(d6_k5_a_3, "Không có tín hiệu trước khi vượt hoặc có tín hiệu vượt xe nhưng không sử dụng trong suốt quá trình vượt xe.").

rule(d6_k5_a_4).
rule_type(d6_k5_a_4, primary_violation).
article(d6_k5_a_4, 6).
clause(d6_k5_a_4, 5).
point(d6_k5_a_4, "a").
subject(d6_k5_a_4, car).
action(d6_k5_a_4, illegal_overtaking_on_right).
context(d6_k5_a_4, overtaking_on_right).
fine_min(d6_k5_a_4, 4000000).
fine_max(d6_k5_a_4, 6000000).
original_vi_text(d6_k5_a_4, "Vượt bên phải xe khác trong trường hợp không được phép.").

rule(d6_k5_b_1).
rule_type(d6_k5_b_1, primary_violation).
article(d6_k5_b_1, 6).
clause(d6_k5_b_1, 5).
point(d6_k5_b_1, "b").
subject(d6_k5_b_1, car).
action(d6_k5_b_1, not_driving_on_right_side).
exception(d6_k5_b_1, violation_d6_k4_a).
fine_min(d6_k5_b_1, 4000000).
fine_max(d6_k5_b_1, 6000000).
original_vi_text(d6_k5_b_1, "Điều khiển xe không đi bên phải theo chiều đi của mình, trừ hành vi quy định tại điểm a khoản 4 Điều này.").

rule(d6_k5_b_2).
rule_type(d6_k5_b_2, primary_violation).
article(d6_k5_b_2, 6).
clause(d6_k5_b_2, 5).
point(d6_k5_b_2, "b").
subject(d6_k5_b_2, car).
action(d6_k5_b_2, wrong_road_part_or_lane).
exception(d6_k5_b_2, violation_d6_k4_a).
fine_min(d6_k5_b_2, 4000000).
fine_max(d6_k5_b_2, 6000000).
original_vi_text(d6_k5_b_2, "Đi không đúng phần đường hoặc làn đường quy định, trừ hành vi quy định tại điểm a khoản 4 Điều này.").

rule(d6_k5_b_3).
rule_type(d6_k5_b_3, primary_violation).
article(d6_k5_b_3, 6).
clause(d6_k5_b_3, 5).
point(d6_k5_b_3, "b").
subject(d6_k5_b_3, car).
action(d6_k5_b_3, crossing_fixed_median).
context(d6_k5_b_3, fixed_median).
exception(d6_k5_b_3, violation_d6_k4_a).
fine_min(d6_k5_b_3, 4000000).
fine_max(d6_k5_b_3, 6000000).
original_vi_text(d6_k5_b_3, "Điều khiển xe đi qua dải phân cách cố định ở giữa hai phần đường xe chạy, trừ hành vi quy định tại điểm a khoản 4 Điều này.").

rule(d6_k5_c_1).
rule_type(d6_k5_c_1, primary_violation).
article(d6_k5_c_1, 6).
clause(d6_k5_c_1, 5).
point(d6_k5_c_1, "c").
subject(d6_k5_c_1, car).
action(d6_k5_c_1, improper_passing_opposite_vehicle).
context(d6_k5_c_1, opposite_vehicle).
exception(d6_k5_c_1, high_beam_violation_d6_k3_b).
fine_min(d6_k5_c_1, 4000000).
fine_max(d6_k5_c_1, 6000000).
original_vi_text(d6_k5_c_1, "Tránh xe đi ngược chiều không đúng quy định, trừ hành vi vi phạm sử dụng đèn chiếu xa khi tránh xe đi ngược chiều quy định tại điểm b khoản 3 Điều này.").

rule(d6_k5_c_2).
rule_type(d6_k5_c_2, primary_violation).
article(d6_k5_c_2, 6).
clause(d6_k5_c_2, 5).
point(d6_k5_c_2, "c").
subject(d6_k5_c_2, car).
action(d6_k5_c_2, not_yielding_to_opposite_vehicle_on_narrow_road_slope_or_obstacle).
context(d6_k5_c_2, narrow_road_or_slope_or_obstacle).
fine_min(d6_k5_c_2, 4000000).
fine_max(d6_k5_c_2, 6000000).
original_vi_text(d6_k5_c_2, "Không nhường đường cho xe đi ngược chiều theo quy định tại nơi đường hẹp, đường dốc, nơi có chướng ngại vật.").

rule(d6_k5_d_1).
rule_type(d6_k5_d_1, primary_violation).
article(d6_k5_d_1, 6).
clause(d6_k5_d_1, 5).
point(d6_k5_d_1, "d").
subject(d6_k5_d_1, car).
action(d6_k5_d_1, improper_highway_entry_or_exit).
context(d6_k5_d_1, highway).
fine_min(d6_k5_d_1, 4000000).
fine_max(d6_k5_d_1, 6000000).
original_vi_text(d6_k5_d_1, "Không tuân thủ quy định khi vào hoặc ra đường cao tốc.").

rule(d6_k5_d_2).
rule_type(d6_k5_d_2, primary_violation).
article(d6_k5_d_2, 6).
clause(d6_k5_d_2, 5).
point(d6_k5_d_2, "d").
subject(d6_k5_d_2, car).
action(d6_k5_d_2, driving_on_highway_emergency_lane_or_shoulder).
context(d6_k5_d_2, highway).
context(d6_k5_d_2, emergency_lane_or_shoulder).
fine_min(d6_k5_d_2, 4000000).
fine_max(d6_k5_d_2, 6000000).
original_vi_text(d6_k5_d_2, "Điều khiển xe chạy ở làn dừng xe khẩn cấp hoặc phần lề đường của đường cao tốc.").

rule(d6_k5_d_3).
rule_type(d6_k5_d_3, primary_violation).
article(d6_k5_d_3, 6).
clause(d6_k5_d_3, 5).
point(d6_k5_d_3, "d").
subject(d6_k5_d_3, car).
action(d6_k5_d_3, unsafe_following_distance_on_highway).
context(d6_k5_d_3, highway).
context(d6_k5_d_3, following_vehicle).
fine_min(d6_k5_d_3, 4000000).
fine_max(d6_k5_d_3, 6000000).
original_vi_text(d6_k5_d_3, "Không tuân thủ quy định về khoảng cách an toàn đối với xe chạy liền trước khi chạy trên đường cao tốc.").

rule(d6_k5_dd).
rule_type(d6_k5_dd, primary_violation).
article(d6_k5_dd, 6).
clause(d6_k5_dd, 5).
point(d6_k5_dd, "đ").
subject(d6_k5_dd, car).
action(d6_k5_dd, speeding_excess_10_to_20_kmh).
context(d6_k5_dd, speed_excess_10_to_20_kmh).
fine_min(d6_k5_dd, 4000000).
fine_max(d6_k5_dd, 6000000).
original_vi_text(d6_k5_dd, "Điều khiển xe chạy quá tốc độ quy định từ 10 km/h đến 20 km/h.").

rule(d6_k5_e).
rule_type(d6_k5_e, primary_violation).
article(d6_k5_e, 6).
clause(d6_k5_e, 5).
point(d6_k5_e, "e").
subject(d6_k5_e, car).
action(d6_k5_e, non_priority_vehicle_uses_priority_signal_device).
context(d6_k5_e, priority_signal_device).
fine_min(d6_k5_e, 4000000).
fine_max(d6_k5_e, 6000000).
original_vi_text(d6_k5_e, "Xe không được quyền ưu tiên lắp đặt, sử dụng thiết bị phát tín hiệu của xe được quyền ưu tiên.").

rule(d6_k5_g).
rule_type(d6_k5_g, primary_violation).
article(d6_k5_g, 6).
clause(d6_k5_g, 5).
point(d6_k5_g, "g").
subject(d6_k5_g, car).
action(d6_k5_g, improper_lane_change_on_highway).
context(d6_k5_g, highway).
context(d6_k5_g, lane_change).
fine_min(d6_k5_g, 4000000).
fine_max(d6_k5_g, 6000000).
original_vi_text(d6_k5_g, "Chuyển làn đường không đúng nơi cho phép hoặc không có tín hiệu báo trước hoặc chuyển làn đường không đúng quy định mỗi lần chuyển làn đường chỉ được phép chuyển sang một làn đường liền kề khi chạy trên đường cao tốc.").

rule(d6_k5_h).
rule_type(d6_k5_h, primary_violation).
article(d6_k5_h, 6).
clause(d6_k5_h, 5).
point(d6_k5_h, "h").
subject(d6_k5_h, car).
action(d6_k5_h, using_phone_or_electronic_device_while_driving).
context(d6_k5_h, vehicle_moving_on_road).
fine_min(d6_k5_h, 4000000).
fine_max(d6_k5_h, 6000000).
original_vi_text(d6_k5_h, "Dùng tay cầm và sử dụng điện thoại hoặc các thiết bị điện tử khác khi điều khiển phương tiện tham gia giao thông đang di chuyển trên đường bộ.").

rule(d6_k5_i).
rule_type(d6_k5_i, primary_violation).
article(d6_k5_i, 6).
clause(d6_k5_i, 5).
point(d6_k5_i, "i").
subject(d6_k5_i, car).
action(d6_k5_i, entering_prohibited_area_or_prohibited_road).
context(d6_k5_i, prohibited_area_or_road).
exception(d6_k5_i, violation_d6_k9_d).
exception(d6_k5_i, violation_d6_k11_dd).
exception(d6_k5_i, entering_irrigation_work_is_prohibited).
exception(d6_k5_i, priority_vehicle_on_emergency_duty).
fine_min(d6_k5_i, 4000000).
fine_max(d6_k5_i, 6000000).
original_vi_text(d6_k5_i, "Đi vào khu vực cấm, đường có biển báo hiệu cấm đi vào đối với loại phương tiện đang điều khiển, trừ hành vi tại điểm d khoản 9, điểm đ khoản 11 Điều này, hành vi bị cấm đi vào công trình thủy lợi và xe ưu tiên đang đi làm nhiệm vụ khẩn cấp.").

rule(d6_k5_k).
rule_type(d6_k5_k, primary_violation).
article(d6_k5_k, 6).
clause(d6_k5_k, 5).
point(d6_k5_k, "k").
subject(d6_k5_k, car).
action(d6_k5_k, illegal_stop_parking_or_u_turn_causing_congestion).
context(d6_k5_k, causing_traffic_congestion).
fine_min(d6_k5_k, 4000000).
fine_max(d6_k5_k, 6000000).
original_vi_text(d6_k5_k, "Dừng xe, đỗ xe, quay đầu xe trái quy định gây ùn tắc giao thông.").

rule(d6_k5_l).
rule_type(d6_k5_l, primary_violation).
article(d6_k5_l, 6).
clause(d6_k5_l, 5).
point(d6_k5_l, "l").
subject(d6_k5_l, car).
action(d6_k5_l, turning_without_yielding_to_pedestrian_wheelchair_or_non_motorized_vehicle).
context(d6_k5_l, turning).
context(d6_k5_l, pedestrian_crossing_or_non_motorized_lane).
fine_min(d6_k5_l, 4000000).
fine_max(d6_k5_l, 6000000).
original_vi_text(d6_k5_l, "Chuyển hướng không nhường quyền đi trước cho người đi bộ, xe lăn của người khuyết tật qua đường tại nơi có vạch kẻ đường dành cho người đi bộ; xe thô sơ đang đi trên phần đường dành cho xe thô sơ.").

rule(d6_k5_m).
rule_type(d6_k5_m, primary_violation).
article(d6_k5_m, 6).
clause(d6_k5_m, 5).
point(d6_k5_m, "m").
subject(d6_k5_m, car).
action(d6_k5_m, turning_without_yielding_to_opposite_vehicle_or_pedestrian_or_non_motorized_vehicle).
context(d6_k5_m, turning).
context(d6_k5_m, opposite_vehicle_or_pedestrian_or_non_motorized_vehicle).
fine_min(d6_k5_m, 4000000).
fine_max(d6_k5_m, 6000000).
original_vi_text(d6_k5_m, "Chuyển hướng không nhường đường cho các xe đi ngược chiều; người đi bộ, xe thô sơ đang qua đường tại nơi không có vạch kẻ đường cho người đi bộ.").

rule(d6_k5_n).
rule_type(d6_k5_n, primary_violation).
article(d6_k5_n, 6).
clause(d6_k5_n, 5).
point(d6_k5_n, "n").
subject(d6_k5_n, car).
action(d6_k5_n, not_slowing_or_yielding_from_minor_road_to_priority_road).
context(d6_k5_n, minor_road_to_priority_road_or_branch_to_main_road).
fine_min(d6_k5_n, 4000000).
fine_max(d6_k5_n, 6000000).
original_vi_text(d6_k5_n, "Không giảm tốc độ hoặc dừng lại và nhường đường khi điều khiển xe đi từ đường không ưu tiên ra đường ưu tiên, từ đường nhánh ra đường chính.").

rule(d6_k5_o_1).
rule_type(d6_k5_o_1, primary_violation).
article(d6_k5_o_1, 6).
clause(d6_k5_o_1, 5).
point(d6_k5_o_1, "o").
subject(d6_k5_o_1, car).
action(d6_k5_o_1, not_yielding_to_vehicle_from_right_at_non_roundabout_intersection).
context(d6_k5_o_1, intersection_without_roundabout_signal).
fine_min(d6_k5_o_1, 4000000).
fine_max(d6_k5_o_1, 6000000).
original_vi_text(d6_k5_o_1, "Không giảm tốc độ và nhường đường cho xe đi đến từ bên phải tại nơi đường giao nhau không có báo hiệu đi theo vòng xuyến.").

rule(d6_k5_o_2).
rule_type(d6_k5_o_2, primary_violation).
article(d6_k5_o_2, 6).
clause(d6_k5_o_2, 5).
point(d6_k5_o_2, "o").
subject(d6_k5_o_2, car).
action(d6_k5_o_2, not_yielding_to_vehicle_from_left_at_roundabout_intersection).
context(d6_k5_o_2, intersection_with_roundabout_signal).
fine_min(d6_k5_o_2, 4000000).
fine_max(d6_k5_o_2, 6000000).
original_vi_text(d6_k5_o_2, "Không giảm tốc độ và nhường đường cho xe đi đến từ bên trái tại nơi đường giao nhau có báo hiệu đi theo vòng xuyến.").

rule(d6_k5_p_1).
rule_type(d6_k5_p_1, primary_violation).
article(d6_k5_p_1, 6).
clause(d6_k5_p_1, 5).
point(d6_k5_p_1, "p").
subject(d6_k5_p_1, car).
action(d6_k5_p_1, carrying_person_on_truck_bed_illegally).
context(d6_k5_p_1, vehicle_running).
fine_min(d6_k5_p_1, 4000000).
fine_max(d6_k5_p_1, 6000000).
original_vi_text(d6_k5_p_1, "Chở người trên thùng xe trái quy định.").

rule(d6_k5_p_2).
rule_type(d6_k5_p_2, primary_violation).
article(d6_k5_p_2, 6).
clause(d6_k5_p_2, 5).
point(d6_k5_p_2, "p").
subject(d6_k5_p_2, car).
action(d6_k5_p_2, carrying_person_on_vehicle_roof).
context(d6_k5_p_2, vehicle_running).
fine_min(d6_k5_p_2, 4000000).
fine_max(d6_k5_p_2, 6000000).
original_vi_text(d6_k5_p_2, "Chở người trên nóc xe.").

rule(d6_k5_p_3).
rule_type(d6_k5_p_3, primary_violation).
article(d6_k5_p_3, 6).
clause(d6_k5_p_3, 5).
point(d6_k5_p_3, "p").
subject(d6_k5_p_3, car).
action(d6_k5_p_3, allowing_person_to_cling_to_vehicle).
context(d6_k5_p_3, vehicle_running).
fine_min(d6_k5_p_3, 4000000).
fine_max(d6_k5_p_3, 6000000).
original_vi_text(d6_k5_p_3, "Để người đu bám ở cửa xe, bên ngoài thành xe khi xe đang chạy.").

rule(d6_k5_q).
rule_type(d6_k5_q, primary_violation).
article(d6_k5_q, 6).
clause(d6_k5_q, 5).
point(d6_k5_q, "q").
subject(d6_k5_q, car).
action(d6_k5_q, opening_vehicle_door_unsafely).
context(d6_k5_q, vehicle_door).
fine_min(d6_k5_q, 4000000).
fine_max(d6_k5_q, 6000000).
original_vi_text(d6_k5_q, "Mở cửa xe, để cửa xe mở không bảo đảm an toàn.").


% =========================
% Dieu 6 - Khoan 6
% Fine: 6000000 - 8000000
% =========================

rule(d6_k6_a).
rule_type(d6_k6_a, primary_violation).
article(d6_k6_a, 6).
clause(d6_k6_a, 6).
point(d6_k6_a, "a").
subject(d6_k6_a, car).
action(d6_k6_a, speeding_over_20_to_35_kmh).
context(d6_k6_a, speed_excess_over_20_to_35_kmh).
fine_min(d6_k6_a, 6000000).
fine_max(d6_k6_a, 8000000).
original_vi_text(d6_k6_a, "Điều khiển xe chạy quá tốc độ quy định trên 20 km/h đến 35 km/h.").

rule(d6_k6_b).
rule_type(d6_k6_b, primary_violation).
article(d6_k6_b, 6).
clause(d6_k6_b, 6).
point(d6_k6_b, "b").
subject(d6_k6_b, car).
action(d6_k6_b, not_yielding_or_obstructing_priority_vehicle).
context(d6_k6_b, priority_vehicle_with_priority_signal_on_duty).
fine_min(d6_k6_b, 6000000).
fine_max(d6_k6_b, 8000000).
original_vi_text(d6_k6_b, "Không nhường đường hoặc gây cản trở xe được quyền ưu tiên đang phát tín hiệu ưu tiên đi làm nhiệm vụ.").

rule(d6_k6_c).
rule_type(d6_k6_c, primary_violation).
article(d6_k6_c, 6).
clause(d6_k6_c, 6).
point(d6_k6_c, "c").
subject(d6_k6_c, car).
action(d6_k6_c, alcohol_concentration_not_exceeding_level_1).
context(d6_k6_c, blood_alcohol_not_exceed_50mg_per_100ml).
context(d6_k6_c, breath_alcohol_not_exceed_025mg_per_l).
fine_min(d6_k6_c, 6000000).
fine_max(d6_k6_c, 8000000).
original_vi_text(d6_k6_c, "Điều khiển xe trên đường mà trong máu hoặc hơi thở có nồng độ cồn nhưng chưa vượt quá 50 miligam/100 mililít máu hoặc chưa vượt quá 0,25 miligam/1 lít khí thở.").

rule(d6_k6_d).
rule_type(d6_k6_d, primary_violation).
article(d6_k6_d, 6).
clause(d6_k6_d, 6).
point(d6_k6_d, "d").
subject(d6_k6_d, car).
action(d6_k6_d, driving_on_sidewalk).
context(d6_k6_d, sidewalk).
exception(d6_k6_d, crossing_sidewalk_to_enter_house_or_office).
fine_min(d6_k6_d, 6000000).
fine_max(d6_k6_d, 8000000).
original_vi_text(d6_k6_d, "Điều khiển xe đi trên vỉa hè, trừ trường hợp điều khiển xe đi qua vỉa hè để vào nhà, cơ quan.").


% =========================
% Dieu 6 - Khoan 7
% Fine: 12000000 - 14000000
% =========================

rule(d6_k7_a).
rule_type(d6_k7_a, primary_violation).
article(d6_k7_a, 6).
clause(d6_k7_a, 7).
point(d6_k7_a, "a").
subject(d6_k7_a, car).
action(d6_k7_a, speeding_over_35_kmh).
context(d6_k7_a, speed_excess_over_35_kmh).
fine_min(d6_k7_a, 12000000).
fine_max(d6_k7_a, 14000000).
original_vi_text(d6_k7_a, "Điều khiển xe chạy quá tốc độ quy định trên 35 km/h.").

rule(d6_k7_b).
rule_type(d6_k7_b, primary_violation).
article(d6_k7_b, 6).
clause(d6_k7_b, 7).
point(d6_k7_b, "b").
subject(d6_k7_b, four_wheeled_motor_vehicle).
action(d6_k7_b, entering_highway).
context(d6_k7_b, highway).
fine_min(d6_k7_b, 12000000).
fine_max(d6_k7_b, 14000000).
original_vi_text(d6_k7_b, "Điều khiển xe chở người bốn bánh có gắn động cơ, xe chở hàng bốn bánh có gắn động cơ đi vào đường cao tốc.").

rule(d6_k7_c_1).
rule_type(d6_k7_c_1, primary_violation).
article(d6_k7_c_1, 6).
clause(d6_k7_c_1, 7).
point(d6_k7_c_1, "c").
subject(d6_k7_c_1, car).
action(d6_k7_c_1, stop_or_parking_on_highway_wrong_place).
context(d6_k7_c_1, highway).
fine_min(d6_k7_c_1, 12000000).
fine_max(d6_k7_c_1, 14000000).
original_vi_text(d6_k7_c_1, "Dừng xe, đỗ xe trên đường cao tốc không đúng nơi quy định.").

rule(d6_k7_c_2).
rule_type(d6_k7_c_2, primary_violation).
article(d6_k7_c_2, 6).
clause(d6_k7_c_2, 7).
point(d6_k7_c_2, "c").
subject(d6_k7_c_2, car).
action(d6_k7_c_2, no_emergency_light_when_forced_stop_in_emergency_lane_on_highway).
context(d6_k7_c_2, highway).
context(d6_k7_c_2, emergency_lane).
context(d6_k7_c_2, vehicle_breakdown_or_force_majeure).
fine_min(d6_k7_c_2, 12000000).
fine_max(d6_k7_c_2, 14000000).
original_vi_text(d6_k7_c_2, "Không có báo hiệu bằng đèn khẩn cấp khi gặp sự cố kỹ thuật hoặc bất khả kháng khác buộc phải dừng xe, đỗ xe ở làn dừng xe khẩn cấp trên đường cao tốc.").

rule(d6_k7_c_3).
rule_type(d6_k7_c_3, primary_violation).
article(d6_k7_c_3, 6).
clause(d6_k7_c_3, 7).
point(d6_k7_c_3, "c").
subject(d6_k7_c_3, car).
action(d6_k7_c_3, no_warning_150m_when_forced_stop_on_highway_lane).
context(d6_k7_c_3, highway).
context(d6_k7_c_3, vehicle_breakdown_or_force_majeure).
context(d6_k7_c_3, stopping_on_part_of_running_lane).
fine_min(d6_k7_c_3, 12000000).
fine_max(d6_k7_c_3, 14000000).
original_vi_text(d6_k7_c_3, "Không có báo hiệu bằng đèn khẩn cấp, không đặt biển cảnh báo Chú ý xe đỗ hoặc đèn cảnh báo về phía sau xe khoảng cách tối thiểu 150 mét khi buộc phải dừng xe, đỗ xe trên một phần làn đường xe chạy trên đường cao tốc.").


% =========================
% Dieu 6 - Khoan 8
% Fine: 16000000 - 18000000
% =========================

rule(d6_k8).
rule_type(d6_k8, primary_violation).
article(d6_k8, 6).
clause(d6_k8, 8).
point(d6_k8, none).
subject(d6_k8, car).
action(d6_k8, causing_accident_and_leaving_or_not_helping_victim).
context(d6_k8, traffic_accident).
fine_min(d6_k8, 16000000).
fine_max(d6_k8, 18000000).
original_vi_text(d6_k8, "Thực hiện hành vi vi phạm gây tai nạn giao thông không dừng ngay phương tiện, không giữ nguyên hiện trường, không trợ giúp người bị nạn, không ở lại hiện trường hoặc không đến trình báo ngay với cơ quan công an, Ủy ban nhân dân nơi gần nhất.").


% =========================
% Dieu 6 - Khoan 9
% Fine: 18000000 - 20000000
% =========================

rule(d6_k9_a).
rule_type(d6_k9_a, primary_violation).
article(d6_k9_a, 6).
clause(d6_k9_a, 9).
point(d6_k9_a, "a").
subject(d6_k9_a, car).
action(d6_k9_a, alcohol_concentration_level_2).
context(d6_k9_a, blood_alcohol_over_50_to_80mg_per_100ml).
context(d6_k9_a, breath_alcohol_over_025_to_04mg_per_l).
fine_min(d6_k9_a, 18000000).
fine_max(d6_k9_a, 20000000).
original_vi_text(d6_k9_a, "Điều khiển xe trên đường mà trong máu hoặc hơi thở có nồng độ cồn vượt quá 50 miligam đến 80 miligam/100 mililít máu hoặc vượt quá 0,25 miligam đến 0,4 miligam/1 lít khí thở.").

rule(d6_k9_b).
rule_type(d6_k9_b, primary_violation).
article(d6_k9_b, 6).
clause(d6_k9_b, 9).
point(d6_k9_b, "b").
subject(d6_k9_b, car).
action(d6_k9_b, disobey_traffic_light).
context(d6_k9_b, traffic_light).
fine_min(d6_k9_b, 18000000).
fine_max(d6_k9_b, 20000000).
original_vi_text(d6_k9_b, "Không chấp hành hiệu lệnh của đèn tín hiệu giao thông.").

rule(d6_k9_c).
rule_type(d6_k9_c, primary_violation).
article(d6_k9_c, 6).
clause(d6_k9_c, 9).
point(d6_k9_c, "c").
subject(d6_k9_c, car).
action(d6_k9_c, disobey_traffic_controller_or_inspector).
context(d6_k9_c, traffic_controller_or_inspector).
fine_min(d6_k9_c, 18000000).
fine_max(d6_k9_c, 20000000).
original_vi_text(d6_k9_c, "Không chấp hành hiệu lệnh, hướng dẫn của người điều khiển giao thông hoặc người kiểm soát giao thông.").

rule(d6_k9_d).
rule_type(d6_k9_d, primary_violation).
article(d6_k9_d, 6).
clause(d6_k9_d, 9).
point(d6_k9_d, "d").
subject(d6_k9_d, car).
action(d6_k9_d, driving_opposite_direction).
context(d6_k9_d, one_way_road_or_no_entry_road).
exception(d6_k9_d, violation_d6_k11_dd).
exception(d6_k9_d, priority_vehicle_on_emergency_duty).
fine_min(d6_k9_d, 18000000).
fine_max(d6_k9_d, 20000000).
original_vi_text(d6_k9_d, "Đi ngược chiều của đường một chiều, đi ngược chiều trên đường có biển Cấm đi ngược chiều, trừ hành vi tại điểm đ khoản 11 Điều này và xe ưu tiên đang đi làm nhiệm vụ khẩn cấp.").


% =========================
% Dieu 6 - Khoan 10
% Fine: 20000000 - 22000000
% =========================

rule(d6_k10_a_1).
rule_type(d6_k10_a_1, primary_violation).
article(d6_k10_a_1, 6).
clause(d6_k10_a_1, 10).
point(d6_k10_a_1, "a").
subject(d6_k10_a_1, car).
action(d6_k10_a_1, no_observation_or_no_slowdown_or_no_stop_causing_accident).
context(d6_k10_a_1, causing_traffic_accident).
exception(d6_k10_a_1, violation_d6_k11_dd).
fine_min(d6_k10_a_1, 20000000).
fine_max(d6_k10_a_1, 22000000).
original_vi_text(d6_k10_a_1, "Điều khiển xe không quan sát, giảm tốc độ hoặc dừng lại để bảo đảm an toàn mà gây tai nạn giao thông.").


rule(d6_k10_a_2).
rule_type(d6_k10_a_2, primary_violation).
article(d6_k10_a_2, 6).
clause(d6_k10_a_2, 10).
point(d6_k10_a_2, "a").
subject(d6_k10_a_2, car).
action(d6_k10_a_2, speeding_causing_accident).
context(d6_k10_a_2, causing_traffic_accident).
exception(d6_k10_a_2, violation_d6_k11_dd).
fine_min(d6_k10_a_2, 20000000).
fine_max(d6_k10_a_2, 22000000).
original_vi_text(d6_k10_a_2, "Chạy quá tốc độ gây tai nạn.").

rule(d6_k10_a_3).
rule_type(d6_k10_a_3, primary_violation).
article(d6_k10_a_3, 6).
clause(d6_k10_a_3, 10).
point(d6_k10_a_3, "a").
subject(d6_k10_a_3, car).
action(d6_k10_a_3, improper_maneuver_causing_accident).
context(d6_k10_a_3, causing_traffic_accident).
exception(d6_k10_a_3, violation_d6_k11_dd).
fine_min(d6_k10_a_3, 20000000).
fine_max(d6_k10_a_3, 22000000).
original_vi_text(d6_k10_a_3, "Dừng, đỗ, quay đầu, lùi, tránh, vượt, chuyển hướng, chuyển làn không đúng quy định gây tai nạn.").

rule(d6_k10_a_4).
rule_type(d6_k10_a_4, primary_violation).
article(d6_k10_a_4, 6).
clause(d6_k10_a_4, 10).
point(d6_k10_a_4, "a").
subject(d6_k10_a_4, car).
action(d6_k10_a_4, wrong_lane_or_no_safe_distance_or_entering_prohibited_road_causing_accident).
context(d6_k10_a_4, causing_traffic_accident).
exception(d6_k10_a_4, violation_d6_k11_dd).
fine_min(d6_k10_a_4, 20000000).
fine_max(d6_k10_a_4, 22000000).
original_vi_text(d6_k10_a_4, "Không đi đúng phần đường, làn đường, không giữ khoảng cách an toàn hoặc đi vào đường cấm gây tai nạn.").

rule(d6_k10_b).
rule_type(d6_k10_b, primary_violation).
article(d6_k10_b, 6).
clause(d6_k10_b, 10).
point(d6_k10_b, "b").
subject(d6_k10_b, car).
action(d6_k10_b, listed_violation_causing_accident).
context(d6_k10_b, causing_traffic_accident).
fine_min(d6_k10_b, 20000000).
fine_max(d6_k10_b, 22000000).
original_vi_text(d6_k10_b, "Vi phạm quy định tại một trong các điểm, khoản được liệt kê của Điều này mà gây tai nạn giao thông.").


% =========================
% Dieu 6 - Khoan 11
% Fine: 30000000 - 40000000
% =========================

rule(d6_k11_a).
rule_type(d6_k11_a, primary_violation).
article(d6_k11_a, 6).
clause(d6_k11_a, 11).
point(d6_k11_a, "a").
subject(d6_k11_a, car).
action(d6_k11_a, alcohol_concentration_level_3).
context(d6_k11_a, blood_alcohol_over_80mg_per_100ml).
context(d6_k11_a, breath_alcohol_over_04mg_per_l).
fine_min(d6_k11_a, 30000000).
fine_max(d6_k11_a, 40000000).
original_vi_text(d6_k11_a, "Điều khiển xe trên đường mà trong máu hoặc hơi thở có nồng độ cồn vượt quá 80 miligam/100 mililít máu hoặc vượt quá 0,4 miligam/1 lít khí thở.").

rule(d6_k11_b).
rule_type(d6_k11_b, primary_violation).
article(d6_k11_b, 6).
clause(d6_k11_b, 11).
point(d6_k11_b, "b").
subject(d6_k11_b, car).
action(d6_k11_b, refusing_alcohol_test).
context(d6_k11_b, official_duty_alcohol_test_request).
fine_min(d6_k11_b, 30000000).
fine_max(d6_k11_b, 40000000).
original_vi_text(d6_k11_b, "Không chấp hành yêu cầu kiểm tra về nồng độ cồn của người thi hành công vụ.").

rule(d6_k11_c).
rule_type(d6_k11_c, primary_violation).
article(d6_k11_c, 6).
clause(d6_k11_c, 11).
point(d6_k11_c, "c").
subject(d6_k11_c, car).
action(d6_k11_c, driving_with_drugs_or_banned_stimulants).
context(d6_k11_c, drug_or_banned_stimulant_in_body).
fine_min(d6_k11_c, 30000000).
fine_max(d6_k11_c, 40000000).
original_vi_text(d6_k11_c, "Điều khiển xe trên đường mà trong cơ thể có chất ma túy hoặc chất kích thích khác mà pháp luật cấm sử dụng.").

rule(d6_k11_d).
rule_type(d6_k11_d, primary_violation).
article(d6_k11_d, 6).
clause(d6_k11_d, 11).
point(d6_k11_d, "d").
subject(d6_k11_d, car).
action(d6_k11_d, refusing_drug_or_banned_stimulant_test).
context(d6_k11_d, official_duty_drug_test_request).
fine_min(d6_k11_d, 30000000).
fine_max(d6_k11_d, 40000000).
original_vi_text(d6_k11_d, "Không chấp hành yêu cầu kiểm tra về chất ma túy hoặc chất kích thích khác mà pháp luật cấm sử dụng của người thi hành công vụ.").

rule(d6_k11_dd).
rule_type(d6_k11_dd, primary_violation).
article(d6_k11_dd, 6).
clause(d6_k11_dd, 11).
point(d6_k11_dd, "đ").
subject(d6_k11_dd, car).
action(d6_k11_dd, driving_opposite_reversing_or_u_turn_on_highway).
context(d6_k11_dd, highway).
exception(d6_k11_dd, priority_vehicle_on_emergency_duty).
fine_min(d6_k11_dd, 30000000).
fine_max(d6_k11_dd, 40000000).
original_vi_text(d6_k11_dd, "Điều khiển xe đi ngược chiều trên đường cao tốc, lùi xe trên đường cao tốc, quay đầu xe trên đường cao tốc, trừ các xe ưu tiên đang đi làm nhiệm vụ khẩn cấp theo quy định.").


% =========================
% Dieu 6 - Khoan 12
% Fine: 40000000 - 50000000
% =========================

rule(d6_k12_1).
rule_type(d6_k12_1, primary_violation).
article(d6_k12_1, 6).
clause(d6_k12_1, 12).
point(d6_k12_1, none).
subject(d6_k12_1, car).
action(d6_k12_1, zigzag_driving).
context(d6_k12_1, road).
fine_min(d6_k12_1, 40000000).
fine_max(d6_k12_1, 50000000).
original_vi_text(d6_k12_1, "Điều khiển xe lạng lách, đánh võng trên đường bộ.").

rule(d6_k12_2).
rule_type(d6_k12_2, primary_violation).
article(d6_k12_2, 6).
clause(d6_k12_2, 12).
point(d6_k12_2, none).
subject(d6_k12_2, car).
action(d6_k12_2, speeding_chasing_each_other).
context(d6_k12_2, road).
context(d6_k12_2, chasing_each_other).
fine_min(d6_k12_2, 40000000).
fine_max(d6_k12_2, 50000000).
original_vi_text(d6_k12_2, "Chạy quá tốc độ đuổi nhau trên đường bộ.").

rule(d6_k12_3).
rule_type(d6_k12_3, primary_violation).
article(d6_k12_3, 6).
clause(d6_k12_3, 12).
point(d6_k12_3, none).
subject(d6_k12_3, car).
action(d6_k12_3, controlling_steering_wheel_by_feet).
context(d6_k12_3, vehicle_running_on_road).
fine_min(d6_k12_3, 40000000).
fine_max(d6_k12_3, 50000000).
original_vi_text(d6_k12_3, "Dùng chân điều khiển vô lăng xe khi xe đang chạy trên đường bộ.").


% =========================
% Dieu 6 - Khoan 13
% Fine: 50000000 - 70000000
% =========================

rule(d6_k13).
rule_type(d6_k13, primary_violation).
article(d6_k13, 6).
clause(d6_k13, 13).
point(d6_k13, none).
subject(d6_k13, car).
action(d6_k13, violation_at_d6_k12_causing_accident).
context(d6_k13, causing_traffic_accident).
exception(d6_k13, violation_d6_k12).
fine_min(d6_k13, 50000000).
fine_max(d6_k13, 70000000).
original_vi_text(d6_k13, "Thực hiện hành vi vi phạm quy định tại khoản 12 Điều này mà gây tai nạn giao thông.").


% =========================
% Dieu 6 - Khoan 14
% Vehicle confiscation
% =========================

rule(d6_k14).
rule_type(d6_k14, additional_penalty).
article(d6_k14, 6).
clause(d6_k14, 14).
point(d6_k14, none).
subject(d6_k14, car).
action(d6_k14, vehicle_confiscation_for_repeat_zigzag_driving).
context(d6_k14, recidivism).
context(d6_k14, zigzag_driving).
original_vi_text(d6_k14, "Tịch thu phương tiện đối với người điều khiển xe tái phạm hành vi điều khiển xe lạng lách, đánh võng quy định tại khoản 12 Điều này.").


% =========================
% Dieu 6 - Khoan 15
% Supplementary penalties
% =========================

rule(d6_k15_a).
rule_type(d6_k15_a, supplementary_penalty).
article(d6_k15_a, 6).
clause(d6_k15_a, 15).
point(d6_k15_a, "a").
subject(d6_k15_a, car).
action(d6_k15_a, confiscate_illegal_priority_signal_device).
context(d6_k15_a, illegal_priority_signal_device).
original_vi_text(d6_k15_a, "Thực hiện hành vi quy định tại điểm e khoản 5 Điều này còn bị tịch thu thiết bị phát tín hiệu ưu tiên lắp đặt, sử dụng trái quy định.").

rule(d6_k15_b).
rule_type(d6_k15_b, supplementary_penalty).
article(d6_k15_b, 6).
clause(d6_k15_b, 15).
point(d6_k15_b, "b").
subject(d6_k15_b, car).
action(d6_k15_b, license_suspension_10_to_12_months).
original_vi_text(d6_k15_b, "Thực hiện hành vi quy định tại khoản 12 Điều này bị tước quyền sử dụng giấy phép lái xe từ 10 tháng đến 12 tháng.").

rule(d6_k15_c).
rule_type(d6_k15_c, supplementary_penalty).
article(d6_k15_c, 6).
clause(d6_k15_c, 15).
point(d6_k15_c, "c").
subject(d6_k15_c, car).
action(d6_k15_c, license_suspension_22_to_24_months).
original_vi_text(d6_k15_c, "Thực hiện hành vi quy định tại điểm a, điểm b, điểm c, điểm d khoản 11; khoản 13; khoản 14 Điều này bị tước quyền sử dụng giấy phép lái xe từ 22 tháng đến 24 tháng.").


% =========================
% Dieu 6 - Khoan 16
% License point deduction
% =========================

rule(d6_k16_a).
rule_type(d6_k16_a, license_point_deduction).
article(d6_k16_a, 6).
clause(d6_k16_a, 16).
point(d6_k16_a, "a").
subject(d6_k16_a, car).
action(d6_k16_a, deduct_02_license_points).
original_vi_text(d6_k16_a, "Thực hiện hành vi quy định tại điểm h, điểm i khoản 3; điểm a, điểm b, điểm c, điểm d, điểm đ, điểm g khoản 4; điểm a, điểm b, điểm c, điểm d, điểm đ, điểm e, điểm g, điểm i, điểm k, điểm n, điểm o khoản 5 Điều này bị trừ điểm giấy phép lái xe 02 điểm.").

rule(d6_k16_b).
rule_type(d6_k16_b, license_point_deduction).
article(d6_k16_b, 6).
clause(d6_k16_b, 16).
point(d6_k16_b, "b").
subject(d6_k16_b, car).
action(d6_k16_b, deduct_04_license_points).
original_vi_text(d6_k16_b, "Thực hiện hành vi quy định tại điểm h khoản 5; khoản 6; điểm b khoản 7; điểm b, điểm c, điểm d khoản 9 Điều này bị trừ điểm giấy phép lái xe 04 điểm.").

rule(d6_k16_c).
rule_type(d6_k16_c, license_point_deduction).
article(d6_k16_c, 6).
clause(d6_k16_c, 16).
point(d6_k16_c, "c").
subject(d6_k16_c, car).
action(d6_k16_c, deduct_06_license_points).
original_vi_text(d6_k16_c, "Thực hiện hành vi quy định tại điểm p khoản 5; điểm a, điểm c khoản 7; khoản 8 Điều này bị trừ điểm giấy phép lái xe 06 điểm.").

rule(d6_k16_d).
rule_type(d6_k16_d, license_point_deduction).
article(d6_k16_d, 6).
clause(d6_k16_d, 16).
point(d6_k16_d, "d").
subject(d6_k16_d, car).
action(d6_k16_d, deduct_10_license_points).
original_vi_text(d6_k16_d, "Thực hiện hành vi quy định tại điểm a khoản 9, khoản 10, điểm đ khoản 11 Điều này bị trừ điểm giấy phép lái xe 10 điểm.").

% =========================
% Điều 7 - Khoản 1
% =========================
% =========================
% Điều 7 - Khoản 1
% Subject: motorbike
% Fine: 200000 - 400000
% Designed for small LLM parsing
% =========================

rule(d7_k1_a).
rule_type(d7_k1_a, primary_violation).
article(d7_k1_a, 7).
clause(d7_k1_a, 1).
point(d7_k1_a, "a").
subject(d7_k1_a, motorbike).
action(d7_k1_a, disobey_signal).
context(d7_k1_a, traffic_sign).
context(d7_k1_a, road_marking).
exception(d7_k1_a, d7_k2_b).
exception(d7_k1_a, d7_k2_d).
exception(d7_k1_a, d7_k2_e).
exception(d7_k1_a, d7_k3_a).
exception(d7_k1_a, d7_k3_c).
exception(d7_k1_a, d7_k3_d).
exception(d7_k1_a, d7_k3_h).
exception(d7_k1_a, d7_k4_a).
exception(d7_k1_a, d7_k4_b).
exception(d7_k1_a, d7_k4_c).
exception(d7_k1_a, d7_k4_d).
exception(d7_k1_a, d7_k6_b).
exception(d7_k1_a, d7_k6_d).
exception(d7_k1_a, d7_k7_a).
exception(d7_k1_a, d7_k7_b).
exception(d7_k1_a, d7_k7_c).
exception(d7_k1_a, d7_k8_a).
exception(d7_k1_a, d7_k9_b).
exception(d7_k1_a, d7_k10_a).
fine_min(d7_k1_a, 200000).
fine_max(d7_k1_a, 400000).
original_vi_text(d7_k1_a, "Không chấp hành hiệu lệnh, chỉ dẫn của biển báo hiệu, vạch kẻ đường, trừ các hành vi vi phạm quy định tại điểm b, điểm d, điểm e khoản 2; điểm a, điểm c, điểm d, điểm h khoản 3; điểm a, điểm b, điểm c, điểm d khoản 4; điểm b, điểm d khoản 6; điểm a, điểm b, điểm c khoản 7; điểm a khoản 8; điểm b khoản 9; điểm a khoản 10 Điều này.").

rule(d7_k1_b_1).
rule_type(d7_k1_b_1, primary_violation).
article(d7_k1_b_1, 7).
clause(d7_k1_b_1, 1).
point(d7_k1_b_1, "b").
subject(d7_k1_b_1, motorbike).
action(d7_k1_b_1, no_signal).
context(d7_k1_b_1, overtaking).
fine_min(d7_k1_b_1, 200000).
fine_max(d7_k1_b_1, 400000).
original_vi_text(d7_k1_b_1, "Không có tín hiệu trước khi vượt xe.").

rule(d7_k1_b_2).
rule_type(d7_k1_b_2, primary_violation).
article(d7_k1_b_2, 7).
clause(d7_k1_b_2, 1).
point(d7_k1_b_2, "b").
subject(d7_k1_b_2, motorbike).
action(d7_k1_b_2, not_maintain_signal).
context(d7_k1_b_2, overtaking).
fine_min(d7_k1_b_2, 200000).
fine_max(d7_k1_b_2, 400000).
original_vi_text(d7_k1_b_2, "Có tín hiệu vượt xe nhưng không sử dụng trong suốt quá trình vượt xe.").

rule(d7_k1_c_1).
rule_type(d7_k1_c_1, primary_violation).
article(d7_k1_c_1, 7).
clause(d7_k1_c_1, 1).
point(d7_k1_c_1, "c").
subject(d7_k1_c_1, three_wheel_motorbike).
action(d7_k1_c_1, no_observation).
context(d7_k1_c_1, reversing).
context(d7_k1_c_1, side_and_rear).
fine_min(d7_k1_c_1, 200000).
fine_max(d7_k1_c_1, 400000).
original_vi_text(d7_k1_c_1, "Lùi xe mô tô ba bánh không quan sát hai bên, phía sau xe.").

rule(d7_k1_c_2).
rule_type(d7_k1_c_2, primary_violation).
article(d7_k1_c_2, 7).
clause(d7_k1_c_2, 1).
point(d7_k1_c_2, "c").
subject(d7_k1_c_2, three_wheel_motorbike).
action(d7_k1_c_2, no_signal).
context(d7_k1_c_2, reversing).
fine_min(d7_k1_c_2, 200000).
fine_max(d7_k1_c_2, 400000).
original_vi_text(d7_k1_c_2, "Lùi xe mô tô ba bánh không có tín hiệu lùi xe.").

rule(d7_k1_d).
rule_type(d7_k1_d, primary_violation).
article(d7_k1_d, 7).
clause(d7_k1_d, 1).
point(d7_k1_d, "d").
subject(d7_k1_d, motorbike).
action(d7_k1_d, carry_passenger).
context(d7_k1_d, passenger_using_umbrella).
fine_min(d7_k1_d, 200000).
fine_max(d7_k1_d, 400000).
original_vi_text(d7_k1_d, "Chở người ngồi trên xe sử dụng ô (dù).").

rule(d7_k1_dd).
rule_type(d7_k1_dd, primary_violation).
article(d7_k1_dd, 7).
clause(d7_k1_dd, 1).
point(d7_k1_dd, "đ").
subject(d7_k1_dd, motorbike).
action(d7_k1_dd, fail_to_yield).
context(d7_k1_dd, intersection).
exception(d7_k1_dd, d7_k6_c).
exception(d7_k1_dd, d7_k6_d).
fine_min(d7_k1_dd, 200000).
fine_max(d7_k1_dd, 400000).
original_vi_text(d7_k1_dd, "Không tuân thủ các quy định về nhường đường tại nơi đường giao nhau, trừ các hành vi vi phạm quy định tại điểm c, điểm d khoản 6 Điều này.").

rule(d7_k1_e_1).
rule_type(d7_k1_e_1, primary_violation).
article(d7_k1_e_1, 7).
clause(d7_k1_e_1, 1).
point(d7_k1_e_1, "e").
subject(d7_k1_e_1, motorbike).
action(d7_k1_e_1, change_lane).
context(d7_k1_e_1, prohibited_place).
fine_min(d7_k1_e_1, 200000).
fine_max(d7_k1_e_1, 400000).
original_vi_text(d7_k1_e_1, "Chuyển làn đường không đúng nơi cho phép.").

rule(d7_k1_e_2).
rule_type(d7_k1_e_2, primary_violation).
article(d7_k1_e_2, 7).
clause(d7_k1_e_2, 1).
point(d7_k1_e_2, "e").
subject(d7_k1_e_2, motorbike).
action(d7_k1_e_2, change_lane).
context(d7_k1_e_2, no_signal).
fine_min(d7_k1_e_2, 200000).
fine_max(d7_k1_e_2, 400000).
original_vi_text(d7_k1_e_2, "Chuyển làn đường không có tín hiệu báo trước.").

rule(d7_k1_e_3).
rule_type(d7_k1_e_3, primary_violation).
article(d7_k1_e_3, 7).
clause(d7_k1_e_3, 1).
point(d7_k1_e_3, "e").
subject(d7_k1_e_3, motorbike).
action(d7_k1_e_3, change_lane).
context(d7_k1_e_3, more_than_one_adjacent_lane).
fine_min(d7_k1_e_3, 200000).
fine_max(d7_k1_e_3, 400000).
original_vi_text(d7_k1_e_3, "Chuyển làn đường không đúng quy định mỗi lần chuyển làn đường chỉ được phép chuyển sang một làn đường liền kề.").

rule(d7_k1_g_1).
rule_type(d7_k1_g_1, primary_violation).
article(d7_k1_g_1, 7).
clause(d7_k1_g_1, 1).
point(d7_k1_g_1, "g").
subject(d7_k1_g_1, motorbike).
action(d7_k1_g_1, no_light).
context(d7_k1_g_1, from_18_to_06).
fine_min(d7_k1_g_1, 200000).
fine_max(d7_k1_g_1, 400000).
original_vi_text(d7_k1_g_1, "Không sử dụng đèn chiếu sáng trong thời gian từ 18 giờ ngày hôm trước đến 06 giờ ngày hôm sau.").

rule(d7_k1_g_2).
rule_type(d7_k1_g_2, primary_violation).
article(d7_k1_g_2, 7).
clause(d7_k1_g_2, 1).
point(d7_k1_g_2, "g").
subject(d7_k1_g_2, motorbike).
action(d7_k1_g_2, no_light).
context(d7_k1_g_2, fog).
context(d7_k1_g_2, limited_visibility).
fine_min(d7_k1_g_2, 200000).
fine_max(d7_k1_g_2, 400000).
original_vi_text(d7_k1_g_2, "Không sử dụng đèn chiếu sáng khi có sương mù làm hạn chế tầm nhìn.").

rule(d7_k1_g_3).
rule_type(d7_k1_g_3, primary_violation).
article(d7_k1_g_3, 7).
clause(d7_k1_g_3, 1).
point(d7_k1_g_3, "g").
subject(d7_k1_g_3, motorbike).
action(d7_k1_g_3, no_light).
context(d7_k1_g_3, smoke_or_dust).
context(d7_k1_g_3, limited_visibility).
fine_min(d7_k1_g_3, 200000).
fine_max(d7_k1_g_3, 400000).
original_vi_text(d7_k1_g_3, "Không sử dụng đèn chiếu sáng khi có khói, bụi làm hạn chế tầm nhìn.").

rule(d7_k1_g_4).
rule_type(d7_k1_g_4, primary_violation).
article(d7_k1_g_4, 7).
clause(d7_k1_g_4, 1).
point(d7_k1_g_4, "g").
subject(d7_k1_g_4, motorbike).
action(d7_k1_g_4, no_light).
context(d7_k1_g_4, rain).
context(d7_k1_g_4, bad_weather).
context(d7_k1_g_4, limited_visibility).
fine_min(d7_k1_g_4, 200000).
fine_max(d7_k1_g_4, 400000).
original_vi_text(d7_k1_g_4, "Không sử dụng đèn chiếu sáng khi trời mưa, thời tiết xấu làm hạn chế tầm nhìn.").

rule(d7_k1_h_1).
rule_type(d7_k1_h_1, primary_violation).
article(d7_k1_h_1, 7).
clause(d7_k1_h_1, 1).
point(d7_k1_h_1, "h").
subject(d7_k1_h_1, motorbike).
action(d7_k1_h_1, avoid_vehicle).
context(d7_k1_h_1, improper).
fine_min(d7_k1_h_1, 200000).
fine_max(d7_k1_h_1, 400000).
original_vi_text(d7_k1_h_1, "Tránh xe không đúng quy định.").

rule(d7_k1_h_2).
rule_type(d7_k1_h_2, primary_violation).
article(d7_k1_h_2, 7).
clause(d7_k1_h_2, 1).
point(d7_k1_h_2, "h").
subject(d7_k1_h_2, motorbike).
action(d7_k1_h_2, use_high_beam).
context(d7_k1_h_2, pedestrian_crossing).
fine_min(d7_k1_h_2, 200000).
fine_max(d7_k1_h_2, 400000).
original_vi_text(d7_k1_h_2, "Sử dụng đèn chiếu xa khi gặp người đi bộ qua đường.").

rule(d7_k1_h_3).
rule_type(d7_k1_h_3, primary_violation).
article(d7_k1_h_3, 7).
clause(d7_k1_h_3, 1).
point(d7_k1_h_3, "h").
subject(d7_k1_h_3, motorbike).
action(d7_k1_h_3, use_high_beam).
context(d7_k1_h_3, residential_area).
context(d7_k1_h_3, active_lighting).
fine_min(d7_k1_h_3, 200000).
fine_max(d7_k1_h_3, 400000).
original_vi_text(d7_k1_h_3, "Sử dụng đèn chiếu xa khi đi trên đoạn đường qua khu dân cư có hệ thống chiếu sáng đang hoạt động.").

rule(d7_k1_h_4).
rule_type(d7_k1_h_4, primary_violation).
article(d7_k1_h_4, 7).
clause(d7_k1_h_4, 1).
point(d7_k1_h_4, "h").
subject(d7_k1_h_4, motorbike).
action(d7_k1_h_4, use_high_beam).
context(d7_k1_h_4, oncoming_vehicle).
exception(d7_k1_h_4, anti_glare_divider).
fine_min(d7_k1_h_4, 200000).
fine_max(d7_k1_h_4, 400000).
original_vi_text(d7_k1_h_4, "Sử dụng đèn chiếu xa khi gặp xe đi ngược chiều, trừ trường hợp dải phân cách có khả năng chống chói.").

rule(d7_k1_h_5).
rule_type(d7_k1_h_5, primary_violation).
article(d7_k1_h_5, 7).
clause(d7_k1_h_5, 1).
point(d7_k1_h_5, "h").
subject(d7_k1_h_5, motorbike).
action(d7_k1_h_5, use_high_beam).
context(d7_k1_h_5, turning).
context(d7_k1_h_5, intersection).
fine_min(d7_k1_h_5, 200000).
fine_max(d7_k1_h_5, 400000).
original_vi_text(d7_k1_h_5, "Sử dụng đèn chiếu xa khi chuyển hướng xe tại nơi đường giao nhau.").

rule(d7_k1_h_6).
rule_type(d7_k1_h_6, primary_violation).
article(d7_k1_h_6, 7).
clause(d7_k1_h_6, 1).
point(d7_k1_h_6, "h").
subject(d7_k1_h_6, motorbike).
action(d7_k1_h_6, fail_to_yield).
context(d7_k1_h_6, oncoming_vehicle).
context(d7_k1_h_6, narrow_road).
fine_min(d7_k1_h_6, 200000).
fine_max(d7_k1_h_6, 400000).
original_vi_text(d7_k1_h_6, "Không nhường đường cho xe đi ngược chiều theo quy định tại nơi đường hẹp.").

rule(d7_k1_h_7).
rule_type(d7_k1_h_7, primary_violation).
article(d7_k1_h_7, 7).
clause(d7_k1_h_7, 1).
point(d7_k1_h_7, "h").
subject(d7_k1_h_7, motorbike).
action(d7_k1_h_7, fail_to_yield).
context(d7_k1_h_7, oncoming_vehicle).
context(d7_k1_h_7, slope_road).
fine_min(d7_k1_h_7, 200000).
fine_max(d7_k1_h_7, 400000).
original_vi_text(d7_k1_h_7, "Không nhường đường cho xe đi ngược chiều theo quy định tại nơi đường dốc.").

rule(d7_k1_h_8).
rule_type(d7_k1_h_8, primary_violation).
article(d7_k1_h_8, 7).
clause(d7_k1_h_8, 1).
point(d7_k1_h_8, "h").
subject(d7_k1_h_8, motorbike).
action(d7_k1_h_8, fail_to_yield).
context(d7_k1_h_8, oncoming_vehicle).
context(d7_k1_h_8, road_obstacle).
fine_min(d7_k1_h_8, 200000).
fine_max(d7_k1_h_8, 400000).
original_vi_text(d7_k1_h_8, "Không nhường đường cho xe đi ngược chiều theo quy định tại nơi có chướng ngại vật.").

rule(d7_k1_i_1).
rule_type(d7_k1_i_1, primary_violation).
article(d7_k1_i_1, 7).
clause(d7_k1_i_1, 1).
point(d7_k1_i_1, "i").
subject(d7_k1_i_1, motorbike).
action(d7_k1_i_1, use_horn).
context(d7_k1_i_1, from_22_to_05).
context(d7_k1_i_1, populated_area).
exception(d7_k1_i_1, priority_vehicle_on_duty).
fine_min(d7_k1_i_1, 200000).
fine_max(d7_k1_i_1, 400000).
original_vi_text(d7_k1_i_1, "Sử dụng còi trong thời gian từ 22 giờ ngày hôm trước đến 05 giờ ngày hôm sau trong khu đông dân cư, trừ các xe ưu tiên đang đi làm nhiệm vụ theo quy định.").

rule(d7_k1_i_2).
rule_type(d7_k1_i_2, primary_violation).
article(d7_k1_i_2, 7).
clause(d7_k1_i_2, 1).
point(d7_k1_i_2, "i").
subject(d7_k1_i_2, motorbike).
action(d7_k1_i_2, use_horn).
context(d7_k1_i_2, from_22_to_05).
context(d7_k1_i_2, medical_facility_area).
exception(d7_k1_i_2, priority_vehicle_on_duty).
fine_min(d7_k1_i_2, 200000).
fine_max(d7_k1_i_2, 400000).
original_vi_text(d7_k1_i_2, "Sử dụng còi trong thời gian từ 22 giờ ngày hôm trước đến 05 giờ ngày hôm sau trong khu vực cơ sở khám bệnh, chữa bệnh, trừ các xe ưu tiên đang đi làm nhiệm vụ theo quy định.").

rule(d7_k1_k).
rule_type(d7_k1_k, primary_violation).
article(d7_k1_k, 7).
clause(d7_k1_k, 1).
point(d7_k1_k, "k").
subject(d7_k1_k, motorbike).
action(d7_k1_k, drive_below_minimum_speed).
context(d7_k1_k, road_with_minimum_speed_limit).
fine_min(d7_k1_k, 200000).
fine_max(d7_k1_k, 400000).
original_vi_text(d7_k1_k, "Điều khiển xe chạy dưới tốc độ tối thiểu trên đoạn đường bộ có quy định tốc độ tối thiểu cho phép.").

% =========================
% Điều 7 - Khoản 2
% Fine: 400000 - 600000
% =========================

rule(d7_k2_a).
rule_type(d7_k2_a, primary_violation).
article(d7_k2_a, 7).
clause(d7_k2_a, 2).
point(d7_k2_a, "a").
subject(d7_k2_a, motorbike).
action(d7_k2_a, stop_or_park).
context(d7_k2_a, roadway).
context(d7_k2_a, outside_urban_area).
context(d7_k2_a, road_has_shoulder).
fine_min(d7_k2_a, 400000).
fine_max(d7_k2_a, 600000).
original_vi_text(d7_k2_a, "Dừng xe, đỗ xe trên phần đường xe chạy ở đoạn đường ngoài đô thị nơi có lề đường.").

rule(d7_k2_b).
rule_type(d7_k2_b, primary_violation).
article(d7_k2_b, 7).
clause(d7_k2_b, 2).
point(d7_k2_b, "b").
subject(d7_k2_b, motorbike).
action(d7_k2_b, speeding_over_5_to_under_10).
context(d7_k2_b, speed_over_5_to_under_10).
fine_min(d7_k2_b, 400000).
fine_max(d7_k2_b, 600000).
original_vi_text(d7_k2_b, "Điều khiển xe chạy quá tốc độ quy định từ 05 km/h đến dưới 10 km/h.").

rule(d7_k2_c).
rule_type(d7_k2_c, primary_violation).
article(d7_k2_c, 7).
clause(d7_k2_c, 2).
point(d7_k2_c, "c").
subject(d7_k2_c, motorbike).
action(d7_k2_c, drive_slowly).
context(d7_k2_c, not_keep_right).
context(d7_k2_c, obstruct_traffic).
fine_min(d7_k2_c, 400000).
fine_max(d7_k2_c, 600000).
original_vi_text(d7_k2_c, "Điều khiển xe chạy tốc độ thấp mà không đi bên phải phần đường xe chạy gây cản trở giao thông.").

rule(d7_k2_d_1).
rule_type(d7_k2_d_1, primary_violation).
article(d7_k2_d_1, 7).
clause(d7_k2_d_1, 2).
point(d7_k2_d_1, "d").
subject(d7_k2_d_1, motorbike).
action(d7_k2_d_1, stop_or_park).
context(d7_k2_d_1, roadway).
context(d7_k2_d_1, obstruct_traffic).
fine_min(d7_k2_d_1, 400000).
fine_max(d7_k2_d_1, 600000).
original_vi_text(d7_k2_d_1, "Dừng xe, đỗ xe ở lòng đường gây cản trở giao thông.").

rule(d7_k2_d_2).
rule_type(d7_k2_d_2, primary_violation).
article(d7_k2_d_2, 7).
clause(d7_k2_d_2, 2).
point(d7_k2_d_2, "d").
subject(d7_k2_d_2, motorbike).
action(d7_k2_d_2, gather_vehicles).
context(d7_k2_d_2, from_3_vehicles).
context(d7_k2_d_2, roadway).
fine_min(d7_k2_d_2, 400000).
fine_max(d7_k2_d_2, 600000).
original_vi_text(d7_k2_d_2, "Tụ tập từ 03 xe trở lên ở lòng đường.").

rule(d7_k2_d_3).
rule_type(d7_k2_d_3, primary_violation).
article(d7_k2_d_3, 7).
clause(d7_k2_d_3, 2).
point(d7_k2_d_3, "d").
subject(d7_k2_d_3, motorbike).
action(d7_k2_d_3, gather_vehicles).
context(d7_k2_d_3, from_3_vehicles).
context(d7_k2_d_3, road_tunnel).
fine_min(d7_k2_d_3, 400000).
fine_max(d7_k2_d_3, 600000).
original_vi_text(d7_k2_d_3, "Tụ tập từ 03 xe trở lên trong hầm đường bộ.").

rule(d7_k2_d_4).
rule_type(d7_k2_d_4, primary_violation).
article(d7_k2_d_4, 7).
clause(d7_k2_d_4, 2).
point(d7_k2_d_4, "d").
subject(d7_k2_d_4, motorbike).
action(d7_k2_d_4, park_vehicle).
context(d7_k2_d_4, roadway).
context(d7_k2_d_4, illegal).
fine_min(d7_k2_d_4, 400000).
fine_max(d7_k2_d_4, 600000).
original_vi_text(d7_k2_d_4, "Đỗ, để xe ở lòng đường trái phép.").

rule(d7_k2_d_5).
rule_type(d7_k2_d_5, primary_violation).
article(d7_k2_d_5, 7).
clause(d7_k2_d_5, 2).
point(d7_k2_d_5, "d").
subject(d7_k2_d_5, motorbike).
action(d7_k2_d_5, park_vehicle).
context(d7_k2_d_5, sidewalk).
context(d7_k2_d_5, illegal).
fine_min(d7_k2_d_5, 400000).
fine_max(d7_k2_d_5, 600000).
original_vi_text(d7_k2_d_5, "Đỗ, để xe ở vỉa hè trái phép.").

rule(d7_k2_dd).
rule_type(d7_k2_dd, primary_violation).
article(d7_k2_dd, 7).
clause(d7_k2_dd, 2).
point(d7_k2_dd, "đ").
subject(d7_k2_dd, motorbike).
action(d7_k2_dd, install_or_use_priority_signal_device).
context(d7_k2_dd, not_priority_vehicle).
fine_min(d7_k2_dd, 400000).
fine_max(d7_k2_dd, 600000).
original_vi_text(d7_k2_dd, "Xe không được quyền ưu tiên lắp đặt, sử dụng thiết bị phát tín hiệu của xe được quyền ưu tiên.").

rule(d7_k2_e_1).
rule_type(d7_k2_e_1, primary_violation).
article(d7_k2_e_1, 7).
clause(d7_k2_e_1, 2).
point(d7_k2_e_1, "e").
subject(d7_k2_e_1, motorbike).
action(d7_k2_e_1, stop_or_park).
context(d7_k2_e_1, passenger_pickup_dropoff_point).
fine_min(d7_k2_e_1, 400000).
fine_max(d7_k2_e_1, 600000).
original_vi_text(d7_k2_e_1, "Dừng xe, đỗ xe trên điểm đón, trả khách.").

rule(d7_k2_e_2).
rule_type(d7_k2_e_2, primary_violation).
article(d7_k2_e_2, 7).
clause(d7_k2_e_2, 2).
point(d7_k2_e_2, "e").
subject(d7_k2_e_2, motorbike).
action(d7_k2_e_2, stop_or_park).
context(d7_k2_e_2, intersection).
fine_min(d7_k2_e_2, 400000).
fine_max(d7_k2_e_2, 600000).
original_vi_text(d7_k2_e_2, "Dừng xe, đỗ xe nơi đường bộ giao nhau.").

rule(d7_k2_e_3).
rule_type(d7_k2_e_3, primary_violation).
article(d7_k2_e_3, 7).
clause(d7_k2_e_3, 2).
point(d7_k2_e_3, "e").
subject(d7_k2_e_3, motorbike).
action(d7_k2_e_3, stop_or_park).
context(d7_k2_e_3, pedestrian_crossing).
fine_min(d7_k2_e_3, 400000).
fine_max(d7_k2_e_3, 600000).
original_vi_text(d7_k2_e_3, "Dừng xe, đỗ xe trên phần đường dành cho người đi bộ qua đường.").

rule(d7_k2_e_4).
rule_type(d7_k2_e_4, primary_violation).
article(d7_k2_e_4, 7).
clause(d7_k2_e_4, 2).
point(d7_k2_e_4, "e").
subject(d7_k2_e_4, motorbike).
action(d7_k2_e_4, stop_vehicle).
context(d7_k2_e_4, no_stopping_and_parking_sign).
fine_min(d7_k2_e_4, 400000).
fine_max(d7_k2_e_4, 600000).
original_vi_text(d7_k2_e_4, "Dừng xe nơi có biển Cấm dừng xe và đỗ xe.").

rule(d7_k2_e_5).
rule_type(d7_k2_e_5, primary_violation).
article(d7_k2_e_5, 7).
clause(d7_k2_e_5, 2).
point(d7_k2_e_5, "e").
subject(d7_k2_e_5, motorbike).
action(d7_k2_e_5, park_vehicle).
context(d7_k2_e_5, no_parking_sign).
fine_min(d7_k2_e_5, 400000).
fine_max(d7_k2_e_5, 600000).
original_vi_text(d7_k2_e_5, "Đỗ xe tại nơi có biển Cấm đỗ xe.").

rule(d7_k2_e_6).
rule_type(d7_k2_e_6, primary_violation).
article(d7_k2_e_6, 7).
clause(d7_k2_e_6, 2).
point(d7_k2_e_6, "e").
subject(d7_k2_e_6, motorbike).
action(d7_k2_e_6, park_vehicle).
context(d7_k2_e_6, no_stopping_and_parking_sign).
fine_min(d7_k2_e_6, 400000).
fine_max(d7_k2_e_6, 600000).
original_vi_text(d7_k2_e_6, "Đỗ xe tại nơi có biển Cấm dừng xe và đỗ xe.").

rule(d7_k2_e_7).
rule_type(d7_k2_e_7, primary_violation).
article(d7_k2_e_7, 7).
clause(d7_k2_e_7, 2).
point(d7_k2_e_7, "e").
subject(d7_k2_e_7, motorbike).
action(d7_k2_e_7, stop_or_park).
context(d7_k2_e_7, railway_level_crossing).
context(d7_k2_e_7, improper).
fine_min(d7_k2_e_7, 400000).
fine_max(d7_k2_e_7, 600000).
original_vi_text(d7_k2_e_7, "Không tuân thủ các quy định về dừng xe, đỗ xe tại nơi đường bộ giao nhau cùng mức với đường sắt.").

rule(d7_k2_e_8).
rule_type(d7_k2_e_8, primary_violation).
article(d7_k2_e_8, 7).
clause(d7_k2_e_8, 2).
point(d7_k2_e_8, "e").
subject(d7_k2_e_8, motorbike).
action(d7_k2_e_8, stop_or_park).
context(d7_k2_e_8, railway_safety_corridor).
fine_min(d7_k2_e_8, 400000).
fine_max(d7_k2_e_8, 600000).
original_vi_text(d7_k2_e_8, "Dừng xe, đỗ xe trong phạm vi hành lang an toàn giao thông đường sắt.").

rule(d7_k2_g).
rule_type(d7_k2_g, primary_violation).
article(d7_k2_g, 7).
clause(d7_k2_g, 2).
point(d7_k2_g, "g").
subject(d7_k2_g, motorbike).
action(d7_k2_g, carry_passengers).
context(d7_k2_g, two_passengers).
exception(d7_k2_g, emergency_patient_transport).
exception(d7_k2_g, child_under_12).
exception(d7_k2_g, elderly_person).
exception(d7_k2_g, disabled_person).
exception(d7_k2_g, escorting_law_violator).
fine_min(d7_k2_g, 400000).
fine_max(d7_k2_g, 600000).
original_vi_text(d7_k2_g, "Chở theo 02 người trên xe, trừ trường hợp chở người bệnh đi cấp cứu, trẻ em dưới 12 tuổi, người già yếu hoặc người khuyết tật, áp giải người có hành vi vi phạm pháp luật.").

rule(d7_k2_h_1).
rule_type(d7_k2_h_1, primary_violation).
article(d7_k2_h_1, 7).
clause(d7_k2_h_1, 2).
point(d7_k2_h_1, "h").
subject(d7_k2_h_1, motorbike).
action(d7_k2_h_1, no_helmet).
context(d7_k2_h_1, driver).
context(d7_k2_h_1, road_traffic).
fine_min(d7_k2_h_1, 400000).
fine_max(d7_k2_h_1, 600000).
original_vi_text(d7_k2_h_1, "Không đội mũ bảo hiểm cho người đi mô tô, xe máy khi điều khiển xe tham gia giao thông trên đường bộ.").

rule(d7_k2_h_2).
rule_type(d7_k2_h_2, primary_violation).
article(d7_k2_h_2, 7).
clause(d7_k2_h_2, 2).
point(d7_k2_h_2, "h").
subject(d7_k2_h_2, motorbike).
action(d7_k2_h_2, improper_helmet).
context(d7_k2_h_2, driver).
context(d7_k2_h_2, road_traffic).
fine_min(d7_k2_h_2, 400000).
fine_max(d7_k2_h_2, 600000).
original_vi_text(d7_k2_h_2, "Đội mũ bảo hiểm cho người đi mô tô, xe máy không cài quai đúng quy cách khi điều khiển xe tham gia giao thông trên đường bộ.").

rule(d7_k2_i_1).
rule_type(d7_k2_i_1, primary_violation).
article(d7_k2_i_1, 7).
clause(d7_k2_i_1, 2).
point(d7_k2_i_1, "i").
subject(d7_k2_i_1, motorbike).
action(d7_k2_i_1, carry_passenger).
context(d7_k2_i_1, passenger_no_helmet).
exception(d7_k2_i_1, emergency_patient_transport).
exception(d7_k2_i_1, child_under_6).
exception(d7_k2_i_1, escorting_law_violator).
fine_min(d7_k2_i_1, 400000).
fine_max(d7_k2_i_1, 600000).
original_vi_text(d7_k2_i_1, "Chở người ngồi trên xe không đội mũ bảo hiểm cho người đi mô tô, xe máy, trừ trường hợp chở người bệnh đi cấp cứu, trẻ em dưới 06 tuổi, áp giải người có hành vi vi phạm pháp luật.").

rule(d7_k2_i_2).
rule_type(d7_k2_i_2, primary_violation).
article(d7_k2_i_2, 7).
clause(d7_k2_i_2, 2).
point(d7_k2_i_2, "i").
subject(d7_k2_i_2, motorbike).
action(d7_k2_i_2, carry_passenger).
context(d7_k2_i_2, passenger_improper_helmet).
exception(d7_k2_i_2, emergency_patient_transport).
exception(d7_k2_i_2, child_under_6).
exception(d7_k2_i_2, escorting_law_violator).
fine_min(d7_k2_i_2, 400000).
fine_max(d7_k2_i_2, 600000).
original_vi_text(d7_k2_i_2, "Chở người ngồi trên xe đội mũ bảo hiểm cho người đi mô tô, xe máy không cài quai đúng quy cách, trừ trường hợp chở người bệnh đi cấp cứu, trẻ em dưới 06 tuổi, áp giải người có hành vi vi phạm pháp luật.").

rule(d7_k2_k).
rule_type(d7_k2_k, primary_violation).
article(d7_k2_k, 7).
clause(d7_k2_k, 2).
point(d7_k2_k, "k").
subject(d7_k2_k, motorbike).
action(d7_k2_k, u_turn).
context(d7_k2_k, prohibited_place).
exception(d7_k2_k, d7_k4_d).
fine_min(d7_k2_k, 400000).
fine_max(d7_k2_k, 600000).
original_vi_text(d7_k2_k, "Quay đầu xe tại nơi không được quay đầu xe, trừ hành vi vi phạm quy định tại điểm d khoản 4 Điều này.").


% =========================
% Điều 7 - Khoản 3
% Fine: 600000 - 800000
% =========================

rule(d7_k3_a_1).
rule_type(d7_k3_a_1, primary_violation).
article(d7_k3_a_1, 7).
clause(d7_k3_a_1, 3).
point(d7_k3_a_1, "a").
subject(d7_k3_a_1, motorbike).
action(d7_k3_a_1, turn).
context(d7_k3_a_1, no_observation).
exception(d7_k3_a_1, curved_road_without_intersection).
fine_min(d7_k3_a_1, 600000).
fine_max(d7_k3_a_1, 800000).
original_vi_text(d7_k3_a_1, "Chuyển hướng không quan sát, trừ trường hợp điều khiển xe đi theo hướng cong của đoạn đường bộ ở nơi đường không giao nhau cùng mức.").

rule(d7_k3_a_2).
rule_type(d7_k3_a_2, primary_violation).
article(d7_k3_a_2, 7).
clause(d7_k3_a_2, 3).
point(d7_k3_a_2, "a").
subject(d7_k3_a_2, motorbike).
action(d7_k3_a_2, turn).
context(d7_k3_a_2, unsafe_distance_with_rear_vehicle).
exception(d7_k3_a_2, curved_road_without_intersection).
fine_min(d7_k3_a_2, 600000).
fine_max(d7_k3_a_2, 800000).
original_vi_text(d7_k3_a_2, "Chuyển hướng không bảo đảm khoảng cách an toàn với xe phía sau, trừ trường hợp điều khiển xe đi theo hướng cong của đoạn đường bộ ở nơi đường không giao nhau cùng mức.").

rule(d7_k3_a_3).
rule_type(d7_k3_a_3, primary_violation).
article(d7_k3_a_3, 7).
clause(d7_k3_a_3, 3).
point(d7_k3_a_3, "a").
subject(d7_k3_a_3, motorbike).
action(d7_k3_a_3, turn).
context(d7_k3_a_3, no_slow_down).
exception(d7_k3_a_3, curved_road_without_intersection).
fine_min(d7_k3_a_3, 600000).
fine_max(d7_k3_a_3, 800000).
original_vi_text(d7_k3_a_3, "Chuyển hướng không giảm tốc độ, trừ trường hợp điều khiển xe đi theo hướng cong của đoạn đường bộ ở nơi đường không giao nhau cùng mức.").

rule(d7_k3_a_4).
rule_type(d7_k3_a_4, primary_violation).
article(d7_k3_a_4, 7).
clause(d7_k3_a_4, 3).
point(d7_k3_a_4, "a").
subject(d7_k3_a_4, motorbike).
action(d7_k3_a_4, turn).
context(d7_k3_a_4, no_signal).
exception(d7_k3_a_4, curved_road_without_intersection).
fine_min(d7_k3_a_4, 600000).
fine_max(d7_k3_a_4, 800000).
original_vi_text(d7_k3_a_4, "Chuyển hướng không có tín hiệu báo hướng rẽ, trừ trường hợp điều khiển xe đi theo hướng cong của đoạn đường bộ ở nơi đường không giao nhau cùng mức.").

rule(d7_k3_a_5).
rule_type(d7_k3_a_5, primary_violation).
article(d7_k3_a_5, 7).
clause(d7_k3_a_5, 3).
point(d7_k3_a_5, "a").
subject(d7_k3_a_5, motorbike).
action(d7_k3_a_5, turn).
context(d7_k3_a_5, not_maintain_signal).
exception(d7_k3_a_5, curved_road_without_intersection).
fine_min(d7_k3_a_5, 600000).
fine_max(d7_k3_a_5, 800000).
original_vi_text(d7_k3_a_5, "Có tín hiệu báo hướng rẽ nhưng không sử dụng liên tục trong quá trình chuyển hướng, trừ trường hợp điều khiển xe đi theo hướng cong của đoạn đường bộ ở nơi đường không giao nhau cùng mức.").

rule(d7_k3_a_6).
rule_type(d7_k3_a_6, primary_violation).
article(d7_k3_a_6, 7).
clause(d7_k3_a_6, 3).
point(d7_k3_a_6, "a").
subject(d7_k3_a_6, motorbike).
action(d7_k3_a_6, turn_left).
context(d7_k3_a_6, no_left_turn_sign).
fine_min(d7_k3_a_6, 600000).
fine_max(d7_k3_a_6, 800000).
original_vi_text(d7_k3_a_6, "Điều khiển xe rẽ trái tại nơi có biển báo hiệu có nội dung cấm rẽ trái đối với loại phương tiện đang điều khiển.").

rule(d7_k3_a_7).
rule_type(d7_k3_a_7, primary_violation).
article(d7_k3_a_7, 7).
clause(d7_k3_a_7, 3).
point(d7_k3_a_7, "a").
subject(d7_k3_a_7, motorbike).
action(d7_k3_a_7, turn_right).
context(d7_k3_a_7, no_right_turn_sign).
fine_min(d7_k3_a_7, 600000).
fine_max(d7_k3_a_7, 800000).
original_vi_text(d7_k3_a_7, "Điều khiển xe rẽ phải tại nơi có biển báo hiệu có nội dung cấm rẽ phải đối với loại phương tiện đang điều khiển.").

rule(d7_k3_b).
rule_type(d7_k3_b, primary_violation).
article(d7_k3_b, 7).
clause(d7_k3_b, 3).
point(d7_k3_b, "b").
subject(d7_k3_b, motorbike).
action(d7_k3_b, carry_passengers).
context(d7_k3_b, from_3_passengers).
fine_min(d7_k3_b, 600000).
fine_max(d7_k3_b, 800000).
original_vi_text(d7_k3_b, "Chở theo từ 03 người trở lên trên xe.").

rule(d7_k3_c).
rule_type(d7_k3_c, primary_violation).
article(d7_k3_c, 7).
clause(d7_k3_c, 3).
point(d7_k3_c, "c").
subject(d7_k3_c, motorbike).
action(d7_k3_c, stop_or_park).
context(d7_k3_c, bridge).
fine_min(d7_k3_c, 600000).
fine_max(d7_k3_c, 800000).
original_vi_text(d7_k3_c, "Dừng xe, đỗ xe trên cầu.").

rule(d7_k3_d_1).
rule_type(d7_k3_d_1, primary_violation).
article(d7_k3_d_1, 7).
clause(d7_k3_d_1, 3).
point(d7_k3_d_1, "d").
subject(d7_k3_d_1, motorbike).
action(d7_k3_d_1, not_keep_right).
context(d7_k3_d_1, own_direction).
fine_min(d7_k3_d_1, 600000).
fine_max(d7_k3_d_1, 800000).
original_vi_text(d7_k3_d_1, "Điều khiển xe không đi bên phải theo chiều đi của mình.").

rule(d7_k3_d_2).
rule_type(d7_k3_d_2, primary_violation).
article(d7_k3_d_2, 7).
clause(d7_k3_d_2, 3).
point(d7_k3_d_2, "d").
subject(d7_k3_d_2, motorbike).
action(d7_k3_d_2, wrong_road_part).
context(d7_k3_d_2, same_direction_lane).
fine_min(d7_k3_d_2, 600000).
fine_max(d7_k3_d_2, 800000).
original_vi_text(d7_k3_d_2, "Đi không đúng phần đường, làn đường quy định đối với làn cùng chiều.").

rule(d7_k3_d_3).
rule_type(d7_k3_d_3, primary_violation).
article(d7_k3_d_3, 7).
clause(d7_k3_d_3, 3).
point(d7_k3_d_3, "d").
subject(d7_k3_d_3, motorbike).
action(d7_k3_d_3, wrong_road_part).
context(d7_k3_d_3, opposite_direction_lane).
fine_min(d7_k3_d_3, 600000).
fine_max(d7_k3_d_3, 800000).
original_vi_text(d7_k3_d_3, "Đi không đúng phần đường, làn đường quy định đối với làn ngược chiều.").

rule(d7_k3_d_4).
rule_type(d7_k3_d_4, primary_violation).
article(d7_k3_d_4, 7).
clause(d7_k3_d_4, 3).
point(d7_k3_d_4, "d").
subject(d7_k3_d_4, motorbike).
action(d7_k3_d_4, cross_divider).
context(d7_k3_d_4, fixed_divider).
fine_min(d7_k3_d_4, 600000).
fine_max(d7_k3_d_4, 800000).
original_vi_text(d7_k3_d_4, "Điều khiển xe đi qua dải phân cách cố định ở giữa hai phần đường xe chạy.").

rule(d7_k3_dd).
rule_type(d7_k3_dd, primary_violation).
article(d7_k3_dd, 7).
clause(d7_k3_dd, 3).
point(d7_k3_dd, "đ").
subject(d7_k3_dd, motorbike).
action(d7_k3_dd, overtake_right).
context(d7_k3_dd, not_allowed).
fine_min(d7_k3_dd, 600000).
fine_max(d7_k3_dd, 800000).
original_vi_text(d7_k3_dd, "Vượt bên phải trong trường hợp không được phép.").

rule(d7_k3_e_1).
rule_type(d7_k3_e_1, primary_violation).
article(d7_k3_e_1, 7).
clause(d7_k3_e_1, 3).
point(d7_k3_e_1, "e").
subject(d7_k3_e_1, motorbike).
action(d7_k3_e_1, cling_to_vehicle).
context(d7_k3_e_1, driver_or_passenger).
fine_min(d7_k3_e_1, 600000).
fine_max(d7_k3_e_1, 800000).
original_vi_text(d7_k3_e_1, "Người đang điều khiển xe hoặc chở người ngồi trên xe bám xe khác.").

rule(d7_k3_e_2).
rule_type(d7_k3_e_2, primary_violation).
article(d7_k3_e_2, 7).
clause(d7_k3_e_2, 3).
point(d7_k3_e_2, "e").
subject(d7_k3_e_2, motorbike).
action(d7_k3_e_2, pull_vehicle_or_object).
context(d7_k3_e_2, driver_or_passenger).
fine_min(d7_k3_e_2, 600000).
fine_max(d7_k3_e_2, 800000).
original_vi_text(d7_k3_e_2, "Người đang điều khiển xe hoặc chở người ngồi trên xe kéo xe khác, vật khác.").

rule(d7_k3_e_3).
rule_type(d7_k3_e_3, primary_violation).
article(d7_k3_e_3, 7).
clause(d7_k3_e_3, 3).
point(d7_k3_e_3, "e").
subject(d7_k3_e_3, motorbike).
action(d7_k3_e_3, push_vehicle_or_object).
context(d7_k3_e_3, driver_or_passenger).
fine_min(d7_k3_e_3, 600000).
fine_max(d7_k3_e_3, 800000).
original_vi_text(d7_k3_e_3, "Người đang điều khiển xe hoặc chở người ngồi trên xe đẩy xe khác, vật khác.").

rule(d7_k3_e_4).
rule_type(d7_k3_e_4, primary_violation).
article(d7_k3_e_4, 7).
clause(d7_k3_e_4, 3).
point(d7_k3_e_4, "e").
subject(d7_k3_e_4, motorbike).
action(d7_k3_e_4, lead_animal).
context(d7_k3_e_4, driver_or_passenger).
fine_min(d7_k3_e_4, 600000).
fine_max(d7_k3_e_4, 800000).
original_vi_text(d7_k3_e_4, "Người đang điều khiển xe hoặc chở người ngồi trên xe dẫn dắt vật nuôi.").

rule(d7_k3_e_5).
rule_type(d7_k3_e_5, primary_violation).
article(d7_k3_e_5, 7).
clause(d7_k3_e_5, 3).
point(d7_k3_e_5, "e").
subject(d7_k3_e_5, motorbike).
action(d7_k3_e_5, carry_bulky_object).
context(d7_k3_e_5, driver_or_passenger).
fine_min(d7_k3_e_5, 600000).
fine_max(d7_k3_e_5, 800000).
original_vi_text(d7_k3_e_5, "Người đang điều khiển xe hoặc chở người ngồi trên xe mang vác vật cồng kềnh.").

rule(d7_k3_e_6).
rule_type(d7_k3_e_6, primary_violation).
article(d7_k3_e_6, 7).
clause(d7_k3_e_6, 3).
point(d7_k3_e_6, "e").
subject(d7_k3_e_6, motorbike).
action(d7_k3_e_6, carry_passenger).
context(d7_k3_e_6, passenger_standing_on_seat).
fine_min(d7_k3_e_6, 600000).
fine_max(d7_k3_e_6, 800000).
original_vi_text(d7_k3_e_6, "Chở người đứng trên yên xe.").

rule(d7_k3_e_7).
rule_type(d7_k3_e_7, primary_violation).
article(d7_k3_e_7, 7).
clause(d7_k3_e_7, 3).
point(d7_k3_e_7, "e").
subject(d7_k3_e_7, motorbike).
action(d7_k3_e_7, carry_passenger).
context(d7_k3_e_7, passenger_standing_on_cargo_rack).
fine_min(d7_k3_e_7, 600000).
fine_max(d7_k3_e_7, 800000).
original_vi_text(d7_k3_e_7, "Chở người đứng trên giá đèo hàng.").

rule(d7_k3_e_8).
rule_type(d7_k3_e_8, primary_violation).
article(d7_k3_e_8, 7).
clause(d7_k3_e_8, 3).
point(d7_k3_e_8, "e").
subject(d7_k3_e_8, motorbike).
action(d7_k3_e_8, carry_passenger).
context(d7_k3_e_8, passenger_sitting_on_handlebar).
fine_min(d7_k3_e_8, 600000).
fine_max(d7_k3_e_8, 800000).
original_vi_text(d7_k3_e_8, "Chở người ngồi trên tay lái của xe.").

rule(d7_k3_g).
rule_type(d7_k3_g, primary_violation).
article(d7_k3_g, 7).
clause(d7_k3_g, 3).
point(d7_k3_g, "g").
subject(d7_k3_g, motorbike).
action(d7_k3_g, tow_vehicle_or_object).
fine_min(d7_k3_g, 600000).
fine_max(d7_k3_g, 800000).
original_vi_text(d7_k3_g, "Điều khiển xe kéo theo xe khác, vật khác.").

rule(d7_k3_h).
rule_type(d7_k3_h, primary_violation).
article(d7_k3_h, 7).
clause(d7_k3_h, 3).
point(d7_k3_h, "h").
subject(d7_k3_h, motorbike).
action(d7_k3_h, no_low_beam).
context(d7_k3_h, road_tunnel).
fine_min(d7_k3_h, 600000).
fine_max(d7_k3_h, 800000).
original_vi_text(d7_k3_h, "Chạy trong hầm đường bộ không sử dụng đèn chiếu sáng gần.").

rule(d7_k3_i_1).
rule_type(d7_k3_i_1, primary_violation).
article(d7_k3_i_1, 7).
clause(d7_k3_i_1, 3).
point(d7_k3_i_1, "i").
subject(d7_k3_i_1, motorbike).
action(d7_k3_i_1, unsafe_distance).
context(d7_k3_i_1, collision_with_front_vehicle).
fine_min(d7_k3_i_1, 600000).
fine_max(d7_k3_i_1, 800000).
original_vi_text(d7_k3_i_1, "Không giữ khoảng cách an toàn để xảy ra va chạm với xe chạy liền trước.").

rule(d7_k3_i_2).
rule_type(d7_k3_i_2, primary_violation).
article(d7_k3_i_2, 7).
clause(d7_k3_i_2, 3).
point(d7_k3_i_2, "i").
subject(d7_k3_i_2, motorbike).
action(d7_k3_i_2, unsafe_distance).
context(d7_k3_i_2, minimum_distance_sign).
fine_min(d7_k3_i_2, 600000).
fine_max(d7_k3_i_2, 800000).
original_vi_text(d7_k3_i_2, "Không giữ khoảng cách theo quy định của biển báo hiệu Cự ly tối thiểu giữa hai xe.").

rule(d7_k3_k).
rule_type(d7_k3_k, primary_violation).
article(d7_k3_k, 7).
clause(d7_k3_k, 3).
point(d7_k3_k, "k").
subject(d7_k3_k, motorbike).
action(d7_k3_k, ride_side_by_side).
context(d7_k3_k, from_3_vehicles).
fine_min(d7_k3_k, 600000).
fine_max(d7_k3_k, 800000).
original_vi_text(d7_k3_k, "Điều khiển xe chạy dàn hàng ngang từ 03 xe trở lên.").

rule(d7_k3_l_1).
rule_type(d7_k3_l_1, primary_violation).
article(d7_k3_l_1, 7).
clause(d7_k3_l_1, 3).
point(d7_k3_l_1, "l").
subject(d7_k3_l_1, priority_vehicle).
action(d7_k3_l_1, install_or_use_priority_signal_device).
context(d7_k3_l_1, improper).
fine_min(d7_k3_l_1, 600000).
fine_max(d7_k3_l_1, 800000).
original_vi_text(d7_k3_l_1, "Xe được quyền ưu tiên lắp đặt, sử dụng thiết bị phát tín hiệu ưu tiên không đúng quy định.").

rule(d7_k3_l_2).
rule_type(d7_k3_l_2, primary_violation).
article(d7_k3_l_2, 7).
clause(d7_k3_l_2, 3).
point(d7_k3_l_2, "l").
subject(d7_k3_l_2, priority_vehicle).
action(d7_k3_l_2, use_priority_signal_device).
context(d7_k3_l_2, no_license).
fine_min(d7_k3_l_2, 600000).
fine_max(d7_k3_l_2, 800000).
original_vi_text(d7_k3_l_2, "Xe được quyền ưu tiên sử dụng thiết bị phát tín hiệu ưu tiên mà không có giấy phép của cơ quan có thẩm quyền cấp.").

rule(d7_k3_l_3).
rule_type(d7_k3_l_3, primary_violation).
article(d7_k3_l_3, 7).
clause(d7_k3_l_3, 3).
point(d7_k3_l_3, "l").
subject(d7_k3_l_3, priority_vehicle).
action(d7_k3_l_3, use_priority_signal_device).
context(d7_k3_l_3, expired_license).
fine_min(d7_k3_l_3, 600000).
fine_max(d7_k3_l_3, 800000).
original_vi_text(d7_k3_l_3, "Xe được quyền ưu tiên sử dụng thiết bị phát tín hiệu ưu tiên có giấy phép của cơ quan có thẩm quyền cấp nhưng không còn giá trị sử dụng theo quy định.").

% =========================
% Điều 7 - Khoản 4
% Fine: 800000 - 1000000
% =========================

rule(d7_k4_a).
rule_type(d7_k4_a, primary_violation).
article(d7_k4_a, 7).
clause(d7_k4_a, 4).
point(d7_k4_a, "a").
subject(d7_k4_a, motorbike).
action(d7_k4_a, speeding_over_10_to_20).
context(d7_k4_a, speed_over_10_to_20).
fine_min(d7_k4_a, 800000).
fine_max(d7_k4_a, 1000000).
original_vi_text(d7_k4_a, "Điều khiển xe chạy quá tốc độ quy định từ 10 km/h đến 20 km/h.").

rule(d7_k4_b).
rule_type(d7_k4_b, primary_violation).
article(d7_k4_b, 7).
clause(d7_k4_b, 4).
point(d7_k4_b, "b").
subject(d7_k4_b, motorbike).
action(d7_k4_b, stop_or_park).
context(d7_k4_b, road_tunnel).
context(d7_k4_b, improper).
fine_min(d7_k4_b, 800000).
fine_max(d7_k4_b, 1000000).
original_vi_text(d7_k4_b, "Dừng xe, đỗ xe trong hầm đường bộ không đúng nơi quy định.").

rule(d7_k4_c_1).
rule_type(d7_k4_c_1, primary_violation).
article(d7_k4_c_1, 7).
clause(d7_k4_c_1, 4).
point(d7_k4_c_1, "c").
subject(d7_k4_c_1, motorbike).
action(d7_k4_c_1, overtake).
context(d7_k4_c_1, not_allowed).
exception(d7_k4_c_1, d7_k3_dd).
fine_min(d7_k4_c_1, 800000).
fine_max(d7_k4_c_1, 1000000).
original_vi_text(d7_k4_c_1, "Vượt xe trong những trường hợp không được vượt, trừ các hành vi vi phạm quy định tại điểm đ khoản 3 Điều này.").

rule(d7_k4_c_2).
rule_type(d7_k4_c_2, primary_violation).
article(d7_k4_c_2, 7).
clause(d7_k4_c_2, 4).
point(d7_k4_c_2, "c").
subject(d7_k4_c_2, motorbike).
action(d7_k4_c_2, overtake).
context(d7_k4_c_2, no_overtaking_sign).
exception(d7_k4_c_2, d7_k3_dd).
fine_min(d7_k4_c_2, 800000).
fine_max(d7_k4_c_2, 1000000).
original_vi_text(d7_k4_c_2, "Vượt xe tại đoạn đường có biển báo hiệu có nội dung cấm vượt đối với loại phương tiện đang điều khiển, trừ các hành vi vi phạm quy định tại điểm đ khoản 3 Điều này.").

rule(d7_k4_d).
rule_type(d7_k4_d, primary_violation).
article(d7_k4_d, 7).
clause(d7_k4_d, 4).
point(d7_k4_d, "d").
subject(d7_k4_d, motorbike).
action(d7_k4_d, u_turn).
context(d7_k4_d, road_tunnel).
fine_min(d7_k4_d, 800000).
fine_max(d7_k4_d, 1000000).
original_vi_text(d7_k4_d, "Quay đầu xe trong hầm đường bộ.").

rule(d7_k4_dd_1).
rule_type(d7_k4_dd_1, primary_violation).
article(d7_k4_dd_1, 7).
clause(d7_k4_dd_1, 4).
point(d7_k4_dd_1, "đ").
subject(d7_k4_dd_1, motorbike).
action(d7_k4_dd_1, use_umbrella).
context(d7_k4_dd_1, driver).
fine_min(d7_k4_dd_1, 800000).
fine_max(d7_k4_dd_1, 1000000).
original_vi_text(d7_k4_dd_1, "Người đang điều khiển xe sử dụng ô (dù).").

rule(d7_k4_dd_2).
rule_type(d7_k4_dd_2, primary_violation).
article(d7_k4_dd_2, 7).
clause(d7_k4_dd_2, 4).
point(d7_k4_dd_2, "đ").
subject(d7_k4_dd_2, motorbike).
action(d7_k4_dd_2, use_audio_device).
context(d7_k4_dd_2, driver).
exception(d7_k4_dd_2, hearing_aid).
fine_min(d7_k4_dd_2, 800000).
fine_max(d7_k4_dd_2, 1000000).
original_vi_text(d7_k4_dd_2, "Người đang điều khiển xe sử dụng thiết bị âm thanh, trừ thiết bị trợ thính.").

rule(d7_k4_dd_3).
rule_type(d7_k4_dd_3, primary_violation).
article(d7_k4_dd_3, 7).
clause(d7_k4_dd_3, 4).
point(d7_k4_dd_3, "đ").
subject(d7_k4_dd_3, motorbike).
action(d7_k4_dd_3, use_phone).
context(d7_k4_dd_3, driver).
context(d7_k4_dd_3, hand_held).
fine_min(d7_k4_dd_3, 800000).
fine_max(d7_k4_dd_3, 1000000).
original_vi_text(d7_k4_dd_3, "Người đang điều khiển xe dùng tay cầm và sử dụng điện thoại.").

rule(d7_k4_dd_4).
rule_type(d7_k4_dd_4, primary_violation).
article(d7_k4_dd_4, 7).
clause(d7_k4_dd_4, 4).
point(d7_k4_dd_4, "đ").
subject(d7_k4_dd_4, motorbike).
action(d7_k4_dd_4, use_electronic_device).
context(d7_k4_dd_4, driver).
context(d7_k4_dd_4, hand_held).
fine_min(d7_k4_dd_4, 800000).
fine_max(d7_k4_dd_4, 1000000).
original_vi_text(d7_k4_dd_4, "Người đang điều khiển xe dùng tay cầm và sử dụng các thiết bị điện tử khác.").


% =========================
% Điều 7 - Khoản 5
% Fine: 1000000 - 2000000
% =========================

rule(d7_k5_a_1).
rule_type(d7_k5_a_1, primary_violation).
article(d7_k5_a_1, 7).
clause(d7_k5_a_1, 5).
point(d7_k5_a_1, "a").
subject(d7_k5_a_1, motorbike).
action(d7_k5_a_1, fail_to_stop_after_accident).
context(d7_k5_a_1, directly_related_to_accident).
exception(d7_k5_a_1, d7_k9_c).
fine_min(d7_k5_a_1, 1000000).
fine_max(d7_k5_a_1, 2000000).
original_vi_text(d7_k5_a_1, "Điều khiển xe có liên quan trực tiếp đến vụ tai nạn giao thông mà không dừng ngay phương tiện, trừ hành vi vi phạm quy định tại điểm c khoản 9 Điều này.").

rule(d7_k5_a_2).
rule_type(d7_k5_a_2, primary_violation).
article(d7_k5_a_2, 7).
clause(d7_k5_a_2, 5).
point(d7_k5_a_2, "a").
subject(d7_k5_a_2, motorbike).
action(d7_k5_a_2, fail_to_keep_scene).
context(d7_k5_a_2, directly_related_to_accident).
exception(d7_k5_a_2, d7_k9_c).
fine_min(d7_k5_a_2, 1000000).
fine_max(d7_k5_a_2, 2000000).
original_vi_text(d7_k5_a_2, "Điều khiển xe có liên quan trực tiếp đến vụ tai nạn giao thông mà không giữ nguyên hiện trường, trừ hành vi vi phạm quy định tại điểm c khoản 9 Điều này.").

rule(d7_k5_a_3).
rule_type(d7_k5_a_3, primary_violation).
article(d7_k5_a_3, 7).
clause(d7_k5_a_3, 5).
point(d7_k5_a_3, "a").
subject(d7_k5_a_3, motorbike).
action(d7_k5_a_3, fail_to_help_victim).
context(d7_k5_a_3, directly_related_to_accident).
exception(d7_k5_a_3, d7_k9_c).
fine_min(d7_k5_a_3, 1000000).
fine_max(d7_k5_a_3, 2000000).
original_vi_text(d7_k5_a_3, "Điều khiển xe có liên quan trực tiếp đến vụ tai nạn giao thông mà không trợ giúp người bị nạn, trừ hành vi vi phạm quy định tại điểm c khoản 9 Điều này.").

rule(d7_k5_b_1).
rule_type(d7_k5_b_1, primary_violation).
article(d7_k5_b_1, 7).
clause(d7_k5_b_1, 5).
point(d7_k5_b_1, "b").
subject(d7_k5_b_1, motorbike).
action(d7_k5_b_1, turn).
context(d7_k5_b_1, fail_to_yield_to_pedestrian).
context(d7_k5_b_1, pedestrian_crossing).
fine_min(d7_k5_b_1, 1000000).
fine_max(d7_k5_b_1, 2000000).
original_vi_text(d7_k5_b_1, "Chuyển hướng không nhường quyền đi trước cho người đi bộ qua đường tại nơi có vạch kẻ đường dành cho người đi bộ.").

rule(d7_k5_b_2).
rule_type(d7_k5_b_2, primary_violation).
article(d7_k5_b_2, 7).
clause(d7_k5_b_2, 5).
point(d7_k5_b_2, "b").
subject(d7_k5_b_2, motorbike).
action(d7_k5_b_2, turn).
context(d7_k5_b_2, fail_to_yield_to_wheelchair).
context(d7_k5_b_2, pedestrian_crossing).
fine_min(d7_k5_b_2, 1000000).
fine_max(d7_k5_b_2, 2000000).
original_vi_text(d7_k5_b_2, "Chuyển hướng không nhường quyền đi trước cho xe lăn của người khuyết tật qua đường tại nơi có vạch kẻ đường dành cho người đi bộ.").

rule(d7_k5_b_3).
rule_type(d7_k5_b_3, primary_violation).
article(d7_k5_b_3, 7).
clause(d7_k5_b_3, 5).
point(d7_k5_b_3, "b").
subject(d7_k5_b_3, motorbike).
action(d7_k5_b_3, turn).
context(d7_k5_b_3, fail_to_yield_to_non_motor_vehicle).
context(d7_k5_b_3, non_motor_vehicle_lane).
fine_min(d7_k5_b_3, 1000000).
fine_max(d7_k5_b_3, 2000000).
original_vi_text(d7_k5_b_3, "Chuyển hướng không nhường quyền đi trước cho xe thô sơ đang đi trên phần đường dành cho xe thô sơ.").

rule(d7_k5_c_1).
rule_type(d7_k5_c_1, primary_violation).
article(d7_k5_c_1, 7).
clause(d7_k5_c_1, 5).
point(d7_k5_c_1, "c").
subject(d7_k5_c_1, motorbike).
action(d7_k5_c_1, turn).
context(d7_k5_c_1, fail_to_yield_to_oncoming_vehicle).
fine_min(d7_k5_c_1, 1000000).
fine_max(d7_k5_c_1, 2000000).
original_vi_text(d7_k5_c_1, "Chuyển hướng không nhường đường cho các xe đi ngược chiều.").

rule(d7_k5_c_2).
rule_type(d7_k5_c_2, primary_violation).
article(d7_k5_c_2, 7).
clause(d7_k5_c_2, 5).
point(d7_k5_c_2, "c").
subject(d7_k5_c_2, motorbike).
action(d7_k5_c_2, turn).
context(d7_k5_c_2, fail_to_yield_to_pedestrian).
context(d7_k5_c_2, no_pedestrian_crossing).
fine_min(d7_k5_c_2, 1000000).
fine_max(d7_k5_c_2, 2000000).
original_vi_text(d7_k5_c_2, "Chuyển hướng không nhường đường cho người đi bộ đang qua đường tại nơi không có vạch kẻ đường cho người đi bộ.").

rule(d7_k5_c_3).
rule_type(d7_k5_c_3, primary_violation).
article(d7_k5_c_3, 7).
clause(d7_k5_c_3, 5).
point(d7_k5_c_3, "c").
subject(d7_k5_c_3, motorbike).
action(d7_k5_c_3, turn).
context(d7_k5_c_3, fail_to_yield_to_non_motor_vehicle).
context(d7_k5_c_3, no_pedestrian_crossing).
fine_min(d7_k5_c_3, 1000000).
fine_max(d7_k5_c_3, 2000000).
original_vi_text(d7_k5_c_3, "Chuyển hướng không nhường đường cho xe thô sơ đang qua đường tại nơi không có vạch kẻ đường cho người đi bộ.").


% =========================
% Điều 7 - Khoản 6
% Fine: 2000000 - 3000000
% =========================

rule(d7_k6_a_1).
rule_type(d7_k6_a_1, primary_violation).
article(d7_k6_a_1, 7).
clause(d7_k6_a_1, 6).
point(d7_k6_a_1, "a").
subject(d7_k6_a_1, motorbike).
action(d7_k6_a_1, alcohol_violation).
context(d7_k6_a_1, blood_alcohol_not_exceed_50mg_per_100ml).
fine_min(d7_k6_a_1, 2000000).
fine_max(d7_k6_a_1, 3000000).
original_vi_text(d7_k6_a_1, "Điều khiển xe trên đường mà trong máu có nồng độ cồn nhưng chưa vượt quá 50 miligam/100 mililít máu.").

rule(d7_k6_a_2).
rule_type(d7_k6_a_2, primary_violation).
article(d7_k6_a_2, 7).
clause(d7_k6_a_2, 6).
point(d7_k6_a_2, "a").
subject(d7_k6_a_2, motorbike).
action(d7_k6_a_2, alcohol_violation).
context(d7_k6_a_2, breath_alcohol_not_exceed_0_25mg_per_liter).
fine_min(d7_k6_a_2, 2000000).
fine_max(d7_k6_a_2, 3000000).
original_vi_text(d7_k6_a_2, "Điều khiển xe trên đường mà trong hơi thở có nồng độ cồn nhưng chưa vượt quá 0,25 miligam/1 lít khí thở.").

rule(d7_k6_b_1).
rule_type(d7_k6_b_1, primary_violation).
article(d7_k6_b_1, 7).
clause(d7_k6_b_1, 6).
point(d7_k6_b_1, "b").
subject(d7_k6_b_1, motorbike).
action(d7_k6_b_1, enter_prohibited_area).
exception(d7_k6_b_1, d7_k7_a).
exception(d7_k6_b_1, d7_k7_b).
exception(d7_k6_b_1, priority_vehicle_on_emergency_duty).
fine_min(d7_k6_b_1, 2000000).
fine_max(d7_k6_b_1, 3000000).
original_vi_text(d7_k6_b_1, "Đi vào khu vực cấm, trừ các hành vi vi phạm quy định tại điểm a, điểm b khoản 7 Điều này và các trường hợp xe ưu tiên đang đi làm nhiệm vụ khẩn cấp theo quy định.").

rule(d7_k6_b_2).
rule_type(d7_k6_b_2, primary_violation).
article(d7_k6_b_2, 7).
clause(d7_k6_b_2, 6).
point(d7_k6_b_2, "b").
subject(d7_k6_b_2, motorbike).
action(d7_k6_b_2, enter_prohibited_road).
context(d7_k6_b_2, prohibited_entry_sign).
exception(d7_k6_b_2, d7_k7_a).
exception(d7_k6_b_2, d7_k7_b).
exception(d7_k6_b_2, priority_vehicle_on_emergency_duty).
fine_min(d7_k6_b_2, 2000000).
fine_max(d7_k6_b_2, 3000000).
original_vi_text(d7_k6_b_2, "Đi vào đường có biển báo hiệu có nội dung cấm đi vào đối với loại phương tiện đang điều khiển, trừ các hành vi vi phạm quy định tại điểm a, điểm b khoản 7 Điều này và các trường hợp xe ưu tiên đang đi làm nhiệm vụ khẩn cấp theo quy định.").

rule(d7_k6_c_1).
rule_type(d7_k6_c_1, primary_violation).
article(d7_k6_c_1, 7).
clause(d7_k6_c_1, 6).
point(d7_k6_c_1, "c").
subject(d7_k6_c_1, motorbike).
action(d7_k6_c_1, no_slow_down).
context(d7_k6_c_1, from_non_priority_road_to_priority_road).
fine_min(d7_k6_c_1, 2000000).
fine_max(d7_k6_c_1, 3000000).
original_vi_text(d7_k6_c_1, "Không giảm tốc độ khi điều khiển xe đi từ đường không ưu tiên ra đường ưu tiên.").

rule(d7_k6_c_2).
rule_type(d7_k6_c_2, primary_violation).
article(d7_k6_c_2, 7).
clause(d7_k6_c_2, 6).
point(d7_k6_c_2, "c").
subject(d7_k6_c_2, motorbike).
action(d7_k6_c_2, fail_to_yield).
context(d7_k6_c_2, from_non_priority_road_to_priority_road).
fine_min(d7_k6_c_2, 2000000).
fine_max(d7_k6_c_2, 3000000).
original_vi_text(d7_k6_c_2, "Không nhường đường khi điều khiển xe đi từ đường không ưu tiên ra đường ưu tiên.").

rule(d7_k6_c_3).
rule_type(d7_k6_c_3, primary_violation).
article(d7_k6_c_3, 7).
clause(d7_k6_c_3, 6).
point(d7_k6_c_3, "c").
subject(d7_k6_c_3, motorbike).
action(d7_k6_c_3, no_slow_down).
context(d7_k6_c_3, from_minor_road_to_main_road).
fine_min(d7_k6_c_3, 2000000).
fine_max(d7_k6_c_3, 3000000).
original_vi_text(d7_k6_c_3, "Không giảm tốc độ khi điều khiển xe đi từ đường nhánh ra đường chính.").

rule(d7_k6_c_4).
rule_type(d7_k6_c_4, primary_violation).
article(d7_k6_c_4, 7).
clause(d7_k6_c_4, 6).
point(d7_k6_c_4, "c").
subject(d7_k6_c_4, motorbike).
action(d7_k6_c_4, fail_to_yield).
context(d7_k6_c_4, from_minor_road_to_main_road).
fine_min(d7_k6_c_4, 2000000).
fine_max(d7_k6_c_4, 3000000).
original_vi_text(d7_k6_c_4, "Không nhường đường khi điều khiển xe đi từ đường nhánh ra đường chính.").

rule(d7_k6_d_1).
rule_type(d7_k6_d_1, primary_violation).
article(d7_k6_d_1, 7).
clause(d7_k6_d_1, 6).
point(d7_k6_d_1, "d").
subject(d7_k6_d_1, motorbike).
action(d7_k6_d_1, no_slow_down).
context(d7_k6_d_1, intersection_without_roundabout_sign).
context(d7_k6_d_1, vehicle_from_right).
fine_min(d7_k6_d_1, 2000000).
fine_max(d7_k6_d_1, 3000000).
original_vi_text(d7_k6_d_1, "Không giảm tốc độ cho xe đi đến từ bên phải tại nơi đường giao nhau không có báo hiệu đi theo vòng xuyến.").

rule(d7_k6_d_2).
rule_type(d7_k6_d_2, primary_violation).
article(d7_k6_d_2, 7).
clause(d7_k6_d_2, 6).
point(d7_k6_d_2, "d").
subject(d7_k6_d_2, motorbike).
action(d7_k6_d_2, fail_to_yield).
context(d7_k6_d_2, intersection_without_roundabout_sign).
context(d7_k6_d_2, vehicle_from_right).
fine_min(d7_k6_d_2, 2000000).
fine_max(d7_k6_d_2, 3000000).
original_vi_text(d7_k6_d_2, "Không nhường đường cho xe đi đến từ bên phải tại nơi đường giao nhau không có báo hiệu đi theo vòng xuyến.").

rule(d7_k6_d_3).
rule_type(d7_k6_d_3, primary_violation).
article(d7_k6_d_3, 7).
clause(d7_k6_d_3, 6).
point(d7_k6_d_3, "d").
subject(d7_k6_d_3, motorbike).
action(d7_k6_d_3, no_slow_down).
context(d7_k6_d_3, intersection_with_roundabout_sign).
context(d7_k6_d_3, vehicle_from_left).
fine_min(d7_k6_d_3, 2000000).
fine_max(d7_k6_d_3, 3000000).
original_vi_text(d7_k6_d_3, "Không giảm tốc độ cho xe đi đến từ bên trái tại nơi đường giao nhau có báo hiệu đi theo vòng xuyến.").

rule(d7_k6_d_4).
rule_type(d7_k6_d_4, primary_violation).
article(d7_k6_d_4, 7).
clause(d7_k6_d_4, 6).
point(d7_k6_d_4, "d").
subject(d7_k6_d_4, motorbike).
action(d7_k6_d_4, fail_to_yield).
context(d7_k6_d_4, intersection_with_roundabout_sign).
context(d7_k6_d_4, vehicle_from_left).
fine_min(d7_k6_d_4, 2000000).
fine_max(d7_k6_d_4, 3000000).
original_vi_text(d7_k6_d_4, "Không nhường đường cho xe đi đến từ bên trái tại nơi đường giao nhau có báo hiệu đi theo vòng xuyến.").


% =========================
% Điều 7 - Khoản 7
% Fine: 4000000 - 6000000
% =========================

rule(d7_k7_a_1).
rule_type(d7_k7_a_1, primary_violation).
article(d7_k7_a_1, 7).
clause(d7_k7_a_1, 7).
point(d7_k7_a_1, "a").
subject(d7_k7_a_1, motorbike).
action(d7_k7_a_1, wrong_way).
context(d7_k7_a_1, one_way_road).
exception(d7_k7_a_1, d7_k7_b).
exception(d7_k7_a_1, priority_vehicle_on_emergency_duty).
fine_min(d7_k7_a_1, 4000000).
fine_max(d7_k7_a_1, 6000000).
original_vi_text(d7_k7_a_1, "Đi ngược chiều của đường một chiều, trừ hành vi vi phạm quy định tại điểm b khoản này và các trường hợp xe ưu tiên đang đi làm nhiệm vụ khẩn cấp theo quy định.").

rule(d7_k7_a_2).
rule_type(d7_k7_a_2, primary_violation).
article(d7_k7_a_2, 7).
clause(d7_k7_a_2, 7).
point(d7_k7_a_2, "a").
subject(d7_k7_a_2, motorbike).
action(d7_k7_a_2, wrong_way).
context(d7_k7_a_2, no_wrong_way_sign).
exception(d7_k7_a_2, d7_k7_b).
exception(d7_k7_a_2, priority_vehicle_on_emergency_duty).
fine_min(d7_k7_a_2, 4000000).
fine_max(d7_k7_a_2, 6000000).
original_vi_text(d7_k7_a_2, "Đi ngược chiều trên đường có biển Cấm đi ngược chiều, trừ hành vi vi phạm quy định tại điểm b khoản này và các trường hợp xe ưu tiên đang đi làm nhiệm vụ khẩn cấp theo quy định.").

rule(d7_k7_a_3).
rule_type(d7_k7_a_3, primary_violation).
article(d7_k7_a_3, 7).
clause(d7_k7_a_3, 7).
point(d7_k7_a_3, "a").
subject(d7_k7_a_3, motorbike).
action(d7_k7_a_3, drive_on_sidewalk).
exception(d7_k7_a_3, crossing_sidewalk_to_enter_house_or_agency).
fine_min(d7_k7_a_3, 4000000).
fine_max(d7_k7_a_3, 6000000).
original_vi_text(d7_k7_a_3, "Điều khiển xe đi trên vỉa hè, trừ trường hợp điều khiển xe đi qua vỉa hè để vào nhà, cơ quan.").

rule(d7_k7_b).
rule_type(d7_k7_b, primary_violation).
article(d7_k7_b, 7).
clause(d7_k7_b, 7).
point(d7_k7_b, "b").
subject(d7_k7_b, motorbike).
action(d7_k7_b, enter_expressway).
exception(d7_k7_b, expressway_management_or_maintenance_vehicle).
fine_min(d7_k7_b, 4000000).
fine_max(d7_k7_b, 6000000).
original_vi_text(d7_k7_b, "Điều khiển xe đi vào đường cao tốc, trừ xe phục vụ việc quản lý, bảo trì đường cao tốc.").

rule(d7_k7_c).
rule_type(d7_k7_c, primary_violation).
article(d7_k7_c, 7).
clause(d7_k7_c, 7).
point(d7_k7_c, "c").
subject(d7_k7_c, motorbike).
action(d7_k7_c, disobey_signal).
context(d7_k7_c, traffic_light).
fine_min(d7_k7_c, 4000000).
fine_max(d7_k7_c, 6000000).
original_vi_text(d7_k7_c, "Không chấp hành hiệu lệnh của đèn tín hiệu giao thông.").

rule(d7_k7_d_1).
rule_type(d7_k7_d_1, primary_violation).
article(d7_k7_d_1, 7).
clause(d7_k7_d_1, 7).
point(d7_k7_d_1, "d").
subject(d7_k7_d_1, motorbike).
action(d7_k7_d_1, disobey_signal).
context(d7_k7_d_1, traffic_controller).
fine_min(d7_k7_d_1, 4000000).
fine_max(d7_k7_d_1, 6000000).
original_vi_text(d7_k7_d_1, "Không chấp hành hiệu lệnh, hướng dẫn của người điều khiển giao thông.").

rule(d7_k7_d_2).
rule_type(d7_k7_d_2, primary_violation).
article(d7_k7_d_2, 7).
clause(d7_k7_d_2, 7).
point(d7_k7_d_2, "d").
subject(d7_k7_d_2, motorbike).
action(d7_k7_d_2, disobey_signal).
context(d7_k7_d_2, traffic_inspector).
fine_min(d7_k7_d_2, 4000000).
fine_max(d7_k7_d_2, 6000000).
original_vi_text(d7_k7_d_2, "Không chấp hành hiệu lệnh, hướng dẫn của người kiểm soát giao thông.").

rule(d7_k7_dd_1).
rule_type(d7_k7_dd_1, primary_violation).
article(d7_k7_dd_1, 7).
clause(d7_k7_dd_1, 7).
point(d7_k7_dd_1, "đ").
subject(d7_k7_dd_1, motorbike).
action(d7_k7_dd_1, fail_to_yield).
context(d7_k7_dd_1, priority_vehicle_on_duty).
context(d7_k7_dd_1, priority_signal_on).
fine_min(d7_k7_dd_1, 4000000).
fine_max(d7_k7_dd_1, 6000000).
original_vi_text(d7_k7_dd_1, "Không nhường đường cho xe được quyền ưu tiên đang phát tín hiệu ưu tiên đi làm nhiệm vụ.").

rule(d7_k7_dd_2).
rule_type(d7_k7_dd_2, primary_violation).
article(d7_k7_dd_2, 7).
clause(d7_k7_dd_2, 7).
point(d7_k7_dd_2, "đ").
subject(d7_k7_dd_2, motorbike).
action(d7_k7_dd_2, obstruct_priority_vehicle).
context(d7_k7_dd_2, priority_vehicle_on_duty).
context(d7_k7_dd_2, priority_signal_on).
fine_min(d7_k7_dd_2, 4000000).
fine_max(d7_k7_dd_2, 6000000).
original_vi_text(d7_k7_dd_2, "Gây cản trở xe được quyền ưu tiên đang phát tín hiệu ưu tiên đi làm nhiệm vụ.").


% =========================
% Điều 7 - Khoản 8
% Fine: 6000000 - 8000000
% =========================

rule(d7_k8_a).
rule_type(d7_k8_a, primary_violation).
article(d7_k8_a, 7).
clause(d7_k8_a, 8).
point(d7_k8_a, "a").
subject(d7_k8_a, motorbike).
action(d7_k8_a, speeding_excess_over_20_kmh).
context(d7_k8_a, speed_over_20).
fine_min(d7_k8_a, 6000000).
fine_max(d7_k8_a, 8000000).
original_vi_text(d7_k8_a, "Điều khiển xe chạy quá tốc độ quy định trên 20 km/h.").

rule(d7_k8_b_1).
rule_type(d7_k8_b_1, primary_violation).
article(d7_k8_b_1, 7).
clause(d7_k8_b_1, 8).
point(d7_k8_b_1, "b").
subject(d7_k8_b_1, motorbike).
action(d7_k8_b_1, alcohol_violation).
context(d7_k8_b_1, blood_alcohol_over_50_to_80mg_per_100ml).
fine_min(d7_k8_b_1, 6000000).
fine_max(d7_k8_b_1, 8000000).
original_vi_text(d7_k8_b_1, "Điều khiển xe trên đường mà trong máu có nồng độ cồn vượt quá 50 miligam đến 80 miligam/100 mililít máu.").

rule(d7_k8_b_2).
rule_type(d7_k8_b_2, primary_violation).
article(d7_k8_b_2, 7).
clause(d7_k8_b_2, 8).
point(d7_k8_b_2, "b").
subject(d7_k8_b_2, motorbike).
action(d7_k8_b_2, alcohol_violation).
context(d7_k8_b_2, breath_alcohol_over_0_25_to_0_4mg_per_liter).
fine_min(d7_k8_b_2, 6000000).
fine_max(d7_k8_b_2, 8000000).
original_vi_text(d7_k8_b_2, "Điều khiển xe trên đường mà trong hơi thở có nồng độ cồn vượt quá 0,25 miligam đến 0,4 miligam/1 lít khí thở.").


% =========================
% Điều 7 - Khoản 9
% Fine: 8000000 - 10000000
% =========================

rule(d7_k9_a_1).
rule_type(d7_k9_a_1, primary_violation).
article(d7_k9_a_1, 7).
clause(d7_k9_a_1, 9).
point(d7_k9_a_1, "a").
subject(d7_k9_a_1, motorbike).
action(d7_k9_a_1, reckless_driving).
context(d7_k9_a_1, swerving).
fine_min(d7_k9_a_1, 8000000).
fine_max(d7_k9_a_1, 10000000).
original_vi_text(d7_k9_a_1, "Điều khiển xe lạng lách, đánh võng trên đường bộ.").

rule(d7_k9_a_2).
rule_type(d7_k9_a_2, primary_violation).
article(d7_k9_a_2, 7).
clause(d7_k9_a_2, 9).
point(d7_k9_a_2, "a").
subject(d7_k9_a_2, motorbike).
action(d7_k9_a_2, scrape_road).
context(d7_k9_a_2, side_stand_or_other_object).
context(d7_k9_a_2, vehicle_running).
fine_min(d7_k9_a_2, 8000000).
fine_max(d7_k9_a_2, 10000000).
original_vi_text(d7_k9_a_2, "Sử dụng chân chống hoặc vật khác quệt xuống đường khi xe đang chạy.").

rule(d7_k9_b).
rule_type(d7_k9_b, primary_violation).
article(d7_k9_b, 7).
clause(d7_k9_b, 9).
point(d7_k9_b, "b").
subject(d7_k9_b, motorbike).
action(d7_k9_b, group_speeding).
context(d7_k9_b, from_2_vehicles).
fine_min(d7_k9_b, 8000000).
fine_max(d7_k9_b, 10000000).
original_vi_text(d7_k9_b, "Điều khiển xe thành nhóm từ 02 xe trở lên chạy quá tốc độ quy định.").

rule(d7_k9_c_1).
rule_type(d7_k9_c_1, primary_violation).
article(d7_k9_c_1, 7).
clause(d7_k9_c_1, 9).
point(d7_k9_c_1, "c").
subject(d7_k9_c_1, motorbike).
action(d7_k9_c_1, fail_to_stop_after_accident).
context(d7_k9_c_1, causing_traffic_accident).
fine_min(d7_k9_c_1, 8000000).
fine_max(d7_k9_c_1, 10000000).
original_vi_text(d7_k9_c_1, "Gây tai nạn giao thông không dừng ngay phương tiện.").

rule(d7_k9_c_2).
rule_type(d7_k9_c_2, primary_violation).
article(d7_k9_c_2, 7).
clause(d7_k9_c_2, 9).
point(d7_k9_c_2, "c").
subject(d7_k9_c_2, motorbike).
action(d7_k9_c_2, fail_to_keep_scene).
context(d7_k9_c_2, causing_traffic_accident).
fine_min(d7_k9_c_2, 8000000).
fine_max(d7_k9_c_2, 10000000).
original_vi_text(d7_k9_c_2, "Gây tai nạn giao thông không giữ nguyên hiện trường.").

rule(d7_k9_c_3).
rule_type(d7_k9_c_3, primary_violation).
article(d7_k9_c_3, 7).
clause(d7_k9_c_3, 9).
point(d7_k9_c_3, "c").
subject(d7_k9_c_3, motorbike).
action(d7_k9_c_3, fail_to_help_victim).
context(d7_k9_c_3, causing_traffic_accident).
fine_min(d7_k9_c_3, 8000000).
fine_max(d7_k9_c_3, 10000000).
original_vi_text(d7_k9_c_3, "Gây tai nạn giao thông không trợ giúp người bị nạn.").

rule(d7_k9_c_4).
rule_type(d7_k9_c_4, primary_violation).
article(d7_k9_c_4, 7).
clause(d7_k9_c_4, 9).
point(d7_k9_c_4, "c").
subject(d7_k9_c_4, motorbike).
action(d7_k9_c_4, leave_scene).
context(d7_k9_c_4, causing_traffic_accident).
fine_min(d7_k9_c_4, 8000000).
fine_max(d7_k9_c_4, 10000000).
original_vi_text(d7_k9_c_4, "Gây tai nạn giao thông không ở lại hiện trường.").

rule(d7_k9_c_5).
rule_type(d7_k9_c_5, primary_violation).
article(d7_k9_c_5, 7).
clause(d7_k9_c_5, 9).
point(d7_k9_c_5, "c").
subject(d7_k9_c_5, motorbike).
action(d7_k9_c_5, fail_to_report).
context(d7_k9_c_5, causing_traffic_accident).
context(d7_k9_c_5, police_or_nearest_people_committee).
fine_min(d7_k9_c_5, 8000000).
fine_max(d7_k9_c_5, 10000000).
original_vi_text(d7_k9_c_5, "Gây tai nạn giao thông không đến trình báo ngay với cơ quan công an, Ủy ban nhân dân nơi gần nhất.").

rule(d7_k9_d_1).
rule_type(d7_k9_d_1, primary_violation).
article(d7_k9_d_1, 7).
clause(d7_k9_d_1, 9).
point(d7_k9_d_1, "d").
subject(d7_k9_d_1, motorbike).
action(d7_k9_d_1, alcohol_violation).
context(d7_k9_d_1, blood_alcohol_over_80mg_per_100ml).
fine_min(d7_k9_d_1, 8000000).
fine_max(d7_k9_d_1, 10000000).
original_vi_text(d7_k9_d_1, "Điều khiển xe trên đường mà trong máu có nồng độ cồn vượt quá 80 miligam/100 mililít máu.").

rule(d7_k9_d_2).
rule_type(d7_k9_d_2, primary_violation).
article(d7_k9_d_2, 7).
clause(d7_k9_d_2, 9).
point(d7_k9_d_2, "d").
subject(d7_k9_d_2, motorbike).
action(d7_k9_d_2, alcohol_violation).
context(d7_k9_d_2, breath_alcohol_over_0_4mg_per_liter).
fine_min(d7_k9_d_2, 8000000).
fine_max(d7_k9_d_2, 10000000).
original_vi_text(d7_k9_d_2, "Điều khiển xe trên đường mà trong hơi thở có nồng độ cồn vượt quá 0,4 miligam/1 lít khí thở.").

rule(d7_k9_dd).
rule_type(d7_k9_dd, primary_violation).
article(d7_k9_dd, 7).
clause(d7_k9_dd, 9).
point(d7_k9_dd, "đ").
subject(d7_k9_dd, motorbike).
action(d7_k9_dd, refuse_test).
context(d7_k9_dd, alcohol_test).
context(d7_k9_dd, law_enforcement_officer).
fine_min(d7_k9_dd, 8000000).
fine_max(d7_k9_dd, 10000000).
original_vi_text(d7_k9_dd, "Không chấp hành yêu cầu kiểm tra về nồng độ cồn của người thi hành công vụ.").

rule(d7_k9_e).
rule_type(d7_k9_e, primary_violation).
article(d7_k9_e, 7).
clause(d7_k9_e, 9).
point(d7_k9_e, "e").
subject(d7_k9_e, motorbike).
action(d7_k9_e, drug_violation).
context(d7_k9_e, prohibited_drug_or_stimulant).
fine_min(d7_k9_e, 8000000).
fine_max(d7_k9_e, 10000000).
original_vi_text(d7_k9_e, "Điều khiển xe trên đường mà trong cơ thể có chất ma túy hoặc chất kích thích khác mà pháp luật cấm sử dụng.").

rule(d7_k9_g).
rule_type(d7_k9_g, primary_violation).
article(d7_k9_g, 7).
clause(d7_k9_g, 9).
point(d7_k9_g, "g").
subject(d7_k9_g, motorbike).
action(d7_k9_g, refuse_test).
context(d7_k9_g, drug_or_stimulant_test).
context(d7_k9_g, law_enforcement_officer).
fine_min(d7_k9_g, 8000000).
fine_max(d7_k9_g, 10000000).
original_vi_text(d7_k9_g, "Không chấp hành yêu cầu kiểm tra về chất ma túy hoặc chất kích thích khác mà pháp luật cấm sử dụng của người thi hành công vụ.").

rule(d7_k9_h).
rule_type(d7_k9_h, primary_violation).
article(d7_k9_h, 7).
clause(d7_k9_h, 9).
point(d7_k9_h, "h").
subject(d7_k9_h, passenger).
action(d7_k9_h, control_vehicle_from_behind).
context(d7_k9_h, arms_around_driver).
exception(d7_k9_h, child_under_6_sitting_in_front).
fine_min(d7_k9_h, 8000000).
fine_max(d7_k9_h, 10000000).
original_vi_text(d7_k9_h, "Ngồi phía sau vòng tay qua người ngồi trước để điều khiển xe, trừ trường hợp chở trẻ em dưới 06 tuổi ngồi phía trước.").

rule(d7_k9_i).
rule_type(d7_k9_i, primary_violation).
article(d7_k9_i, 7).
clause(d7_k9_i, 9).
point(d7_k9_i, "i").
subject(d7_k9_i, motorbike).
action(d7_k9_i, ride_in_group).
context(d7_k9_i, obstruct_traffic).
exception(d7_k9_i, authorized_permission).
fine_min(d7_k9_i, 8000000).
fine_max(d7_k9_i, 10000000).
original_vi_text(d7_k9_i, "Điều khiển xe thành đoàn gây cản trở giao thông, trừ trường hợp được cơ quan có thẩm quyền cấp phép.").

rule(d7_k9_k_1).
rule_type(d7_k9_k_1, primary_violation).
article(d7_k9_k_1, 7).
clause(d7_k9_k_1, 9).
point(d7_k9_k_1, "k").
subject(d7_k9_k_1, motorbike).
action(d7_k9_k_1, use_horn_continuously).
context(d7_k9_k_1, populated_area).
exception(d7_k9_k_1, priority_vehicle_on_duty).
fine_min(d7_k9_k_1, 8000000).
fine_max(d7_k9_k_1, 10000000).
original_vi_text(d7_k9_k_1, "Sử dụng còi liên tục trong khu đông dân cư, trừ các xe ưu tiên đang đi làm nhiệm vụ theo quy định.").

rule(d7_k9_k_2).
rule_type(d7_k9_k_2, primary_violation).
article(d7_k9_k_2, 7).
clause(d7_k9_k_2, 9).
point(d7_k9_k_2, "k").
subject(d7_k9_k_2, motorbike).
action(d7_k9_k_2, rev_engine_continuously).
context(d7_k9_k_2, populated_area).
exception(d7_k9_k_2, priority_vehicle_on_duty).
fine_min(d7_k9_k_2, 8000000).
fine_max(d7_k9_k_2, 10000000).
original_vi_text(d7_k9_k_2, "Rú ga (nẹt pô) liên tục trong khu đông dân cư, trừ các xe ưu tiên đang đi làm nhiệm vụ theo quy định.").

rule(d7_k9_k_3).
rule_type(d7_k9_k_3, primary_violation).
article(d7_k9_k_3, 7).
clause(d7_k9_k_3, 9).
point(d7_k9_k_3, "k").
subject(d7_k9_k_3, motorbike).
action(d7_k9_k_3, use_horn_continuously).
context(d7_k9_k_3, medical_facility_area).
exception(d7_k9_k_3, priority_vehicle_on_duty).
fine_min(d7_k9_k_3, 8000000).
fine_max(d7_k9_k_3, 10000000).
original_vi_text(d7_k9_k_3, "Sử dụng còi liên tục trong khu vực cơ sở khám bệnh, chữa bệnh, trừ các xe ưu tiên đang đi làm nhiệm vụ theo quy định.").

rule(d7_k9_k_4).
rule_type(d7_k9_k_4, primary_violation).
article(d7_k9_k_4, 7).
clause(d7_k9_k_4, 9).
point(d7_k9_k_4, "k").
subject(d7_k9_k_4, motorbike).
action(d7_k9_k_4, rev_engine_continuously).
context(d7_k9_k_4, medical_facility_area).
exception(d7_k9_k_4, priority_vehicle_on_duty).
fine_min(d7_k9_k_4, 8000000).
fine_max(d7_k9_k_4, 10000000).
original_vi_text(d7_k9_k_4, "Rú ga (nẹt pô) liên tục trong khu vực cơ sở khám bệnh, chữa bệnh, trừ các xe ưu tiên đang đi làm nhiệm vụ theo quy định.").

% =========================
% Điều 7 - Khoản 10
% Fine: 10000000 - 14000000
% =========================

rule(d7_k10_a_1).
rule_type(d7_k10_a_1, primary_violation).
article(d7_k10_a_1, 7).
clause(d7_k10_a_1, 10).
point(d7_k10_a_1, "a").
subject(d7_k10_a_1, motorbike).
action(d7_k10_a_1, no_observation).
context(d7_k10_a_1, causing_traffic_accident).
fine_min(d7_k10_a_1, 10000000).
fine_max(d7_k10_a_1, 14000000).
original_vi_text(d7_k10_a_1, "Điều khiển xe không quan sát để bảo đảm an toàn theo quy định mà gây tai nạn giao thông.").

rule(d7_k10_a_2).
rule_type(d7_k10_a_2, primary_violation).
article(d7_k10_a_2, 7).
clause(d7_k10_a_2, 10).
point(d7_k10_a_2, "a").
subject(d7_k10_a_2, motorbike).
action(d7_k10_a_2, no_slow_down).
context(d7_k10_a_2, causing_traffic_accident).
fine_min(d7_k10_a_2, 10000000).
fine_max(d7_k10_a_2, 14000000).
original_vi_text(d7_k10_a_2, "Điều khiển xe không giảm tốc độ để bảo đảm an toàn theo quy định mà gây tai nạn giao thông.").

rule(d7_k10_a_3).
rule_type(d7_k10_a_3, primary_violation).
article(d7_k10_a_3, 7).
clause(d7_k10_a_3, 10).
point(d7_k10_a_3, "a").
subject(d7_k10_a_3, motorbike).
action(d7_k10_a_3, fail_to_stop).
context(d7_k10_a_3, causing_traffic_accident).
fine_min(d7_k10_a_3, 10000000).
fine_max(d7_k10_a_3, 14000000).
original_vi_text(d7_k10_a_3, "Điều khiển xe không dừng lại để bảo đảm an toàn theo quy định mà gây tai nạn giao thông.").

rule(d7_k10_a_4).
rule_type(d7_k10_a_4, primary_violation).
article(d7_k10_a_4, 7).
clause(d7_k10_a_4, 10).
point(d7_k10_a_4, "a").
subject(d7_k10_a_4, motorbike).
action(d7_k10_a_4, speeding).
context(d7_k10_a_4, causing_traffic_accident).
fine_min(d7_k10_a_4, 10000000).
fine_max(d7_k10_a_4, 14000000).
original_vi_text(d7_k10_a_4, "Điều khiển xe chạy quá tốc độ quy định gây tai nạn giao thông.").

rule(d7_k10_a_5).
rule_type(d7_k10_a_5, primary_violation).
article(d7_k10_a_5, 7).
clause(d7_k10_a_5, 10).
point(d7_k10_a_5, "a").
subject(d7_k10_a_5, motorbike).
action(d7_k10_a_5, enter_expressway).
context(d7_k10_a_5, improper).
context(d7_k10_a_5, causing_traffic_accident).
fine_min(d7_k10_a_5, 10000000).
fine_max(d7_k10_a_5, 14000000).
original_vi_text(d7_k10_a_5, "Đi vào đường cao tốc không đúng quy định gây tai nạn giao thông.").

rule(d7_k10_a_6).
rule_type(d7_k10_a_6, primary_violation).
article(d7_k10_a_6, 7).
clause(d7_k10_a_6, 10).
point(d7_k10_a_6, "a").
subject(d7_k10_a_6, motorbike).
action(d7_k10_a_6, stop_vehicle).
context(d7_k10_a_6, improper).
context(d7_k10_a_6, causing_traffic_accident).
fine_min(d7_k10_a_6, 10000000).
fine_max(d7_k10_a_6, 14000000).
original_vi_text(d7_k10_a_6, "Dừng xe không đúng quy định gây tai nạn giao thông.").

rule(d7_k10_a_7).
rule_type(d7_k10_a_7, primary_violation).
article(d7_k10_a_7, 7).
clause(d7_k10_a_7, 10).
point(d7_k10_a_7, "a").
subject(d7_k10_a_7, motorbike).
action(d7_k10_a_7, park_vehicle).
context(d7_k10_a_7, improper).
context(d7_k10_a_7, causing_traffic_accident).
fine_min(d7_k10_a_7, 10000000).
fine_max(d7_k10_a_7, 14000000).
original_vi_text(d7_k10_a_7, "Đỗ xe không đúng quy định gây tai nạn giao thông.").

rule(d7_k10_a_8).
rule_type(d7_k10_a_8, primary_violation).
article(d7_k10_a_8, 7).
clause(d7_k10_a_8, 10).
point(d7_k10_a_8, "a").
subject(d7_k10_a_8, motorbike).
action(d7_k10_a_8, u_turn).
context(d7_k10_a_8, improper).
context(d7_k10_a_8, causing_traffic_accident).
fine_min(d7_k10_a_8, 10000000).
fine_max(d7_k10_a_8, 14000000).
original_vi_text(d7_k10_a_8, "Quay đầu xe không đúng quy định gây tai nạn giao thông.").

rule(d7_k10_a_9).
rule_type(d7_k10_a_9, primary_violation).
article(d7_k10_a_9, 7).
clause(d7_k10_a_9, 10).
point(d7_k10_a_9, "a").
subject(d7_k10_a_9, motorbike).
action(d7_k10_a_9, reverse).
context(d7_k10_a_9, improper).
context(d7_k10_a_9, causing_traffic_accident).
fine_min(d7_k10_a_9, 10000000).
fine_max(d7_k10_a_9, 14000000).
original_vi_text(d7_k10_a_9, "Lùi xe không đúng quy định gây tai nạn giao thông.").

rule(d7_k10_a_10).
rule_type(d7_k10_a_10, primary_violation).
article(d7_k10_a_10, 7).
clause(d7_k10_a_10, 10).
point(d7_k10_a_10, "a").
subject(d7_k10_a_10, motorbike).
action(d7_k10_a_10, overtake).
context(d7_k10_a_10, improper).
context(d7_k10_a_10, causing_traffic_accident).
fine_min(d7_k10_a_10, 10000000).
fine_max(d7_k10_a_10, 14000000).
original_vi_text(d7_k10_a_10, "Vượt xe không đúng quy định gây tai nạn giao thông.").

rule(d7_k10_a_11).
rule_type(d7_k10_a_11, primary_violation).
article(d7_k10_a_11, 7).
clause(d7_k10_a_11, 10).
point(d7_k10_a_11, "a").
subject(d7_k10_a_11, motorbike).
action(d7_k10_a_11, turn).
context(d7_k10_a_11, improper).
context(d7_k10_a_11, causing_traffic_accident).
fine_min(d7_k10_a_11, 10000000).
fine_max(d7_k10_a_11, 14000000).
original_vi_text(d7_k10_a_11, "Chuyển hướng không đúng quy định gây tai nạn giao thông.").

rule(d7_k10_a_12).
rule_type(d7_k10_a_12, primary_violation).
article(d7_k10_a_12, 7).
clause(d7_k10_a_12, 10).
point(d7_k10_a_12, "a").
subject(d7_k10_a_12, motorbike).
action(d7_k10_a_12, change_lane).
context(d7_k10_a_12, improper).
context(d7_k10_a_12, causing_traffic_accident).
fine_min(d7_k10_a_12, 10000000).
fine_max(d7_k10_a_12, 14000000).
original_vi_text(d7_k10_a_12, "Chuyển làn đường không đúng quy định gây tai nạn giao thông.").

rule(d7_k10_a_13).
rule_type(d7_k10_a_13, primary_violation).
article(d7_k10_a_13, 7).
clause(d7_k10_a_13, 10).
point(d7_k10_a_13, "a").
subject(d7_k10_a_13, motorbike).
action(d7_k10_a_13, wrong_road_part).
context(d7_k10_a_13, causing_traffic_accident).
fine_min(d7_k10_a_13, 10000000).
fine_max(d7_k10_a_13, 14000000).
original_vi_text(d7_k10_a_13, "Không đi đúng phần đường, làn đường gây tai nạn giao thông.").

rule(d7_k10_a_14).
rule_type(d7_k10_a_14, primary_violation).
article(d7_k10_a_14, 7).
clause(d7_k10_a_14, 10).
point(d7_k10_a_14, "a").
subject(d7_k10_a_14, motorbike).
action(d7_k10_a_14, unsafe_distance).
context(d7_k10_a_14, causing_traffic_accident).
fine_min(d7_k10_a_14, 10000000).
fine_max(d7_k10_a_14, 14000000).
original_vi_text(d7_k10_a_14, "Không giữ khoảng cách an toàn giữa hai xe theo quy định gây tai nạn giao thông.").

rule(d7_k10_a_15).
rule_type(d7_k10_a_15, primary_violation).
article(d7_k10_a_15, 7).
clause(d7_k10_a_15, 10).
point(d7_k10_a_15, "a").
subject(d7_k10_a_15, motorbike).
action(d7_k10_a_15, enter_prohibited_road).
context(d7_k10_a_15, prohibited_entry_sign).
context(d7_k10_a_15, causing_traffic_accident).
fine_min(d7_k10_a_15, 10000000).
fine_max(d7_k10_a_15, 14000000).
original_vi_text(d7_k10_a_15, "Đi vào đường có biển báo hiệu có nội dung cấm đi vào đối với loại phương tiện đang điều khiển gây tai nạn giao thông.").

rule(d7_k10_a_16).
rule_type(d7_k10_a_16, primary_violation).
article(d7_k10_a_16, 7).
clause(d7_k10_a_16, 10).
point(d7_k10_a_16, "a").
subject(d7_k10_a_16, motorbike).
action(d7_k10_a_16, wrong_way).
context(d7_k10_a_16, one_way_road).
context(d7_k10_a_16, causing_traffic_accident).
fine_min(d7_k10_a_16, 10000000).
fine_max(d7_k10_a_16, 14000000).
original_vi_text(d7_k10_a_16, "Đi ngược chiều của đường một chiều gây tai nạn giao thông.").

rule(d7_k10_a_17).
rule_type(d7_k10_a_17, primary_violation).
article(d7_k10_a_17, 7).
clause(d7_k10_a_17, 10).
point(d7_k10_a_17, "a").
subject(d7_k10_a_17, motorbike).
action(d7_k10_a_17, wrong_way).
context(d7_k10_a_17, no_wrong_way_sign).
context(d7_k10_a_17, causing_traffic_accident).
fine_min(d7_k10_a_17, 10000000).
fine_max(d7_k10_a_17, 14000000).
original_vi_text(d7_k10_a_17, "Đi ngược chiều trên đường có biển Cấm đi ngược chiều gây tai nạn giao thông.").

rule(d7_k10_b).
rule_type(d7_k10_b, primary_violation).
article(d7_k10_b, 7).
clause(d7_k10_b, 10).
point(d7_k10_b, "b").
subject(d7_k10_b, motorbike).
action(d7_k10_b, referenced_violation_causing_accident).
context(d7_k10_b, causing_traffic_accident).
reference_rule(d7_k10_b, d7_k1_a).
reference_rule(d7_k10_b, d7_k1_d).
reference_rule(d7_k10_b, d7_k1_dd).
reference_rule(d7_k10_b, d7_k1_g).
reference_rule(d7_k10_b, d7_k1_h).
reference_rule(d7_k10_b, d7_k1_i).
reference_rule(d7_k10_b, d7_k1_k).
reference_rule(d7_k10_b, d7_k2_c).
reference_rule(d7_k10_b, d7_k2_dd).
reference_rule(d7_k10_b, d7_k2_g).
reference_rule(d7_k10_b, d7_k3_b).
reference_rule(d7_k10_b, d7_k3_e).
reference_rule(d7_k10_b, d7_k3_g).
reference_rule(d7_k10_b, d7_k3_h).
reference_rule(d7_k10_b, d7_k3_k).
reference_rule(d7_k10_b, d7_k4_dd).
reference_rule(d7_k10_b, d7_k6_c).
reference_rule(d7_k10_b, d7_k6_d).
reference_rule(d7_k10_b, d7_k7_c).
reference_rule(d7_k10_b, d7_k7_d).
reference_rule(d7_k10_b, d7_k7_dd).
reference_rule(d7_k10_b, d7_k9_a).
reference_rule(d7_k10_b, d7_k9_b).
reference_rule(d7_k10_b, d7_k9_h).
reference_rule(d7_k10_b, d7_k9_k).
fine_min(d7_k10_b, 10000000).
fine_max(d7_k10_b, 14000000).
original_vi_text(d7_k10_b, "Vi phạm quy định tại một trong các điểm, khoản sau của Điều này mà gây tai nạn giao thông: điểm a, điểm d, điểm đ, điểm g, điểm h, điểm i, điểm k khoản 1; điểm c, điểm đ, điểm g khoản 2; điểm b, điểm e, điểm g, điểm h, điểm k khoản 3; điểm đ khoản 4; điểm c, điểm d khoản 6; điểm c, điểm d, điểm đ khoản 7; điểm a, điểm b, điểm h, điểm k khoản 9 Điều này.").


% =========================
% Điều 7 - Khoản 11
% Main sanction: confiscation
% =========================

rule(d7_k11_a_1).
rule_type(d7_k11_a_1, confiscation).
article(d7_k11_a_1, 7).
clause(d7_k11_a_1, 11).
point(d7_k11_a_1, "a").
subject(d7_k11_a_1, motorbike).
action(d7_k11_a_1, release_both_hands).
context(d7_k11_a_1, driving).
main_sanction(d7_k11_a_1, vehicle_confiscation).
original_vi_text(d7_k11_a_1, "Buông cả hai tay khi đang điều khiển xe.").

rule(d7_k11_a_2).
rule_type(d7_k11_a_2, confiscation).
article(d7_k11_a_2, 7).
clause(d7_k11_a_2, 11).
point(d7_k11_a_2, "a").
subject(d7_k11_a_2, motorbike).
action(d7_k11_a_2, control_by_feet).
main_sanction(d7_k11_a_2, vehicle_confiscation).
original_vi_text(d7_k11_a_2, "Dùng chân điều khiển xe.").

rule(d7_k11_a_3).
rule_type(d7_k11_a_3, confiscation).
article(d7_k11_a_3, 7).
clause(d7_k11_a_3, 11).
point(d7_k11_a_3, "a").
subject(d7_k11_a_3, motorbike).
action(d7_k11_a_3, sit_on_one_side).
context(d7_k11_a_3, driving).
main_sanction(d7_k11_a_3, vehicle_confiscation).
original_vi_text(d7_k11_a_3, "Ngồi về một bên điều khiển xe.").

rule(d7_k11_a_4).
rule_type(d7_k11_a_4, confiscation).
article(d7_k11_a_4, 7).
clause(d7_k11_a_4, 11).
point(d7_k11_a_4, "a").
subject(d7_k11_a_4, motorbike).
action(d7_k11_a_4, lie_on_seat).
context(d7_k11_a_4, driving).
main_sanction(d7_k11_a_4, vehicle_confiscation).
original_vi_text(d7_k11_a_4, "Nằm trên yên xe điều khiển xe.").

rule(d7_k11_a_5).
rule_type(d7_k11_a_5, confiscation).
article(d7_k11_a_5, 7).
clause(d7_k11_a_5, 11).
point(d7_k11_a_5, "a").
subject(d7_k11_a_5, motorbike).
action(d7_k11_a_5, change_driver).
context(d7_k11_a_5, vehicle_running).
main_sanction(d7_k11_a_5, vehicle_confiscation).
original_vi_text(d7_k11_a_5, "Thay người điều khiển khi xe đang chạy.").

rule(d7_k11_a_6).
rule_type(d7_k11_a_6, confiscation).
article(d7_k11_a_6, 7).
clause(d7_k11_a_6, 11).
point(d7_k11_a_6, "a").
subject(d7_k11_a_6, motorbike).
action(d7_k11_a_6, turn_back_to_control).
main_sanction(d7_k11_a_6, vehicle_confiscation).
original_vi_text(d7_k11_a_6, "Quay người về phía sau để điều khiển xe.").

rule(d7_k11_a_7).
rule_type(d7_k11_a_7, confiscation).
article(d7_k11_a_7, 7).
clause(d7_k11_a_7, 11).
point(d7_k11_a_7, "a").
subject(d7_k11_a_7, motorbike).
action(d7_k11_a_7, blindfolded_driving).
main_sanction(d7_k11_a_7, vehicle_confiscation).
original_vi_text(d7_k11_a_7, "Bịt mắt điều khiển xe.").

rule(d7_k11_b_1).
rule_type(d7_k11_b_1, confiscation).
article(d7_k11_b_1, 7).
clause(d7_k11_b_1, 11).
point(d7_k11_b_1, "b").
subject(d7_k11_b_1, two_wheel_motorbike).
action(d7_k11_b_1, one_wheel_driving).
main_sanction(d7_k11_b_1, vehicle_confiscation).
original_vi_text(d7_k11_b_1, "Điều khiển xe chạy bằng một bánh đối với xe hai bánh.").

rule(d7_k11_b_2).
rule_type(d7_k11_b_2, confiscation).
article(d7_k11_b_2, 7).
clause(d7_k11_b_2, 11).
point(d7_k11_b_2, "b").
subject(d7_k11_b_2, three_wheel_motorbike).
action(d7_k11_b_2, two_wheel_driving).
main_sanction(d7_k11_b_2, vehicle_confiscation).
original_vi_text(d7_k11_b_2, "Điều khiển xe chạy bằng hai bánh đối với xe ba bánh.").

rule(d7_k11_c).
rule_type(d7_k11_c, confiscation).
article(d7_k11_c, 7).
clause(d7_k11_c, 11).
point(d7_k11_c, "c").
subject(d7_k11_c, motorbike).
action(d7_k11_c, reckless_driving).
context(d7_k11_c, repeat_violation).
reference_rule(d7_k11_c, d7_k9_a).
main_sanction(d7_k11_c, vehicle_confiscation).
original_vi_text(d7_k11_c, "Tái phạm hành vi điều khiển xe lạng lách, đánh võng quy định tại điểm a khoản 9 Điều này.").


% =========================
% Điều 7 - Khoản 12
% Additional sanctions
% =========================

rule(d7_k12_a).
rule_type(d7_k12_a, additional_sanction).
article(d7_k12_a, 7).
clause(d7_k12_a, 12).
point(d7_k12_a, "a").
reference_rule(d7_k12_a, d7_k2_dd).
additional_sanction(d7_k12_a, confiscate_priority_signal_device).
original_vi_text(d7_k12_a, "Thực hiện hành vi quy định tại điểm đ khoản 2 Điều này còn bị tịch thu thiết bị phát tín hiệu ưu tiên lắp đặt, sử dụng trái quy định.").

rule(d7_k12_b).
rule_type(d7_k12_b, additional_sanction).
article(d7_k12_b, 7).
clause(d7_k12_b, 12).
point(d7_k12_b, "b").
reference_rule(d7_k12_b, d7_k9_a).
reference_rule(d7_k12_b, d7_k9_b).
reference_rule(d7_k12_b, d7_k9_h).
reference_rule(d7_k12_b, d7_k9_i).
reference_rule(d7_k12_b, d7_k9_k).
additional_sanction(d7_k12_b, license_suspension).
suspension_min_months(d7_k12_b, 10).
suspension_max_months(d7_k12_b, 12).
original_vi_text(d7_k12_b, "Thực hiện hành vi quy định tại điểm a, điểm b, điểm h, điểm i, điểm k khoản 9 Điều này bị tước quyền sử dụng giấy phép lái xe từ 10 tháng đến 12 tháng.").

rule(d7_k12_c).
rule_type(d7_k12_c, additional_sanction).
article(d7_k12_c, 7).
clause(d7_k12_c, 12).
point(d7_k12_c, "c").
reference_rule(d7_k12_c, d7_k9_d).
reference_rule(d7_k12_c, d7_k9_dd).
reference_rule(d7_k12_c, d7_k9_e).
reference_rule(d7_k12_c, d7_k9_g).
reference_rule(d7_k12_c, d7_k11).
additional_sanction(d7_k12_c, license_suspension).
suspension_min_months(d7_k12_c, 22).
suspension_max_months(d7_k12_c, 24).
original_vi_text(d7_k12_c, "Thực hiện hành vi quy định tại điểm d, điểm đ, điểm e, điểm g khoản 9; khoản 11 Điều này bị tước quyền sử dụng giấy phép lái xe từ 22 tháng đến 24 tháng.").

rule(d9_k1_a_1).
rule_type(d9_k1_a_1, primary_violation).
article(d9_k1_a_1, 9).
clause(d9_k1_a_1, 1).
point(d9_k1_a_1, "a").
subject(d9_k1_a_1, non_motorized_vehicle).
action(d9_k1_a_1, not_drive_on_right_side).
fine_min(d9_k1_a_1, 100000).
fine_max(d9_k1_a_1, 200000).
original_vi_text(d9_k1_a_1, "Không đi bên phải theo chiều đi của mình").

rule(d9_k1_a_2).
rule_type(d9_k1_a_2, primary_violation).
article(d9_k1_a_2, 9).
clause(d9_k1_a_2, 1).
point(d9_k1_a_2, "a").
subject(d9_k1_a_2, non_motorized_vehicle).
action(d9_k1_a_2, drive_wrong_road_part).
fine_min(d9_k1_a_2, 100000).
fine_max(d9_k1_a_2, 200000).
original_vi_text(d9_k1_a_2, "Đi không đúng phần đường quy định").

rule(d9_k1_b_1).
rule_type(d9_k1_b_1, primary_violation).
article(d9_k1_b_1, 9).
clause(d9_k1_b_1, 1).
point(d9_k1_b_1, "b").
subject(d9_k1_b_1, non_motorized_vehicle).
action(d9_k1_b_1, sudden_stop).
fine_min(d9_k1_b_1, 100000).
fine_max(d9_k1_b_1, 200000).
original_vi_text(d9_k1_b_1, "Dừng xe đột ngột").

rule(d9_k1_b_2).
rule_type(d9_k1_b_2, primary_violation).
article(d9_k1_b_2, 9).
clause(d9_k1_b_2, 1).
point(d9_k1_b_2, "b").
subject(d9_k1_b_2, non_motorized_vehicle).
action(d9_k1_b_2, turn_without_signal).
fine_min(d9_k1_b_2, 100000).
fine_max(d9_k1_b_2, 200000).
original_vi_text(d9_k1_b_2, "Chuyển hướng không báo hiệu trước").

rule(d9_k1_c).
rule_type(d9_k1_c, primary_violation).
article(d9_k1_c, 9).
clause(d9_k1_c, 1).
point(d9_k1_c, "c").
subject(d9_k1_c, non_motorized_vehicle).
action(d9_k1_c, disobey_traffic_signs_or_road_markings).
exception_ref(d9_k1_c, exception_d9_k2_dd_or_d9_k3_c).
fine_min(d9_k1_c, 100000).
fine_max(d9_k1_c, 200000).
original_vi_text(d9_k1_c, "Không chấp hành hiệu lệnh hoặc chỉ dẫn của biển báo hiệu, vạch kẻ đường").

rule(d9_k1_d).
rule_type(d9_k1_d, primary_violation).
article(d9_k1_d, 9).
clause(d9_k1_d, 1).
point(d9_k1_d, "d").
subject(d9_k1_d, non_motorized_vehicle).
action(d9_k1_d, overtake_on_right_illegally).
fine_min(d9_k1_d, 100000).
fine_max(d9_k1_d, 200000).
original_vi_text(d9_k1_d, "Vượt bên phải trong các trường hợp không được phép").

rule(d9_k1_dd).
rule_type(d9_k1_dd, primary_violation).
article(d9_k1_dd, 9).
clause(d9_k1_dd, 1).
point(d9_k1_dd, "đ").
subject(d9_k1_dd, non_motorized_vehicle).
action(d9_k1_dd, stop_or_park_on_roadway).
context(d9_k1_dd, outside_urban_area_with_road_shoulder).
fine_min(d9_k1_dd, 100000).
fine_max(d9_k1_dd, 200000).
original_vi_text(d9_k1_dd, "Dừng xe, đỗ xe trên phần đường xe chạy ở đoạn đường ngoài đô thị nơi có lề đường").

rule(d9_k1_e_1).
rule_type(d9_k1_e_1, primary_violation).
article(d9_k1_e_1, 9).
clause(d9_k1_e_1, 1).
point(d9_k1_e_1, "e").
subject(d9_k1_e_1, non_motorized_vehicle).
action(d9_k1_e_1, drive_in_tunnel_without_light_or_reflector).
context(d9_k1_e_1, in_road_tunnel).
fine_min(d9_k1_e_1, 100000).
fine_max(d9_k1_e_1, 200000).
original_vi_text(d9_k1_e_1, "Chạy trong hầm đường bộ không bật đèn hoặc không có vật phát sáng báo hiệu").

rule(d9_k1_e_2).
rule_type(d9_k1_e_2, primary_violation).
article(d9_k1_e_2, 9).
clause(d9_k1_e_2, 1).
point(d9_k1_e_2, "e").
subject(d9_k1_e_2, non_motorized_vehicle).
action(d9_k1_e_2, stop_or_park_wrong_place_in_tunnel).
context(d9_k1_e_2, in_road_tunnel).
fine_min(d9_k1_e_2, 100000).
fine_max(d9_k1_e_2, 200000).
original_vi_text(d9_k1_e_2, "Dừng xe, đỗ xe trong hầm đường bộ không đúng nơi quy định").

rule(d9_k1_e_3).
rule_type(d9_k1_e_3, primary_violation).
article(d9_k1_e_3, 9).
clause(d9_k1_e_3, 1).
point(d9_k1_e_3, "e").
subject(d9_k1_e_3, non_motorized_vehicle).
action(d9_k1_e_3, make_u_turn_in_tunnel).
context(d9_k1_e_3, in_road_tunnel).
fine_min(d9_k1_e_3, 100000).
fine_max(d9_k1_e_3, 200000).
original_vi_text(d9_k1_e_3, "Quay đầu xe trong hầm đường bộ").

rule(d9_k1_g_1).
rule_type(d9_k1_g_1, primary_violation).
article(d9_k1_g_1, 9).
clause(d9_k1_g_1, 1).
point(d9_k1_g_1, "g").
subject(d9_k1_g_1, bicycle).
action(d9_k1_g_1, ride_side_by_side).
context(d9_k1_g_1, three_or_more_vehicles).
fine_min(d9_k1_g_1, 100000).
fine_max(d9_k1_g_1, 200000).
original_vi_text(d9_k1_g_1, "Điều khiển xe đạp, xe đạp máy đi dàn hàng ngang từ 03 xe trở lên").

rule(d9_k1_g_2).
rule_type(d9_k1_g_2, primary_violation).
article(d9_k1_g_2, 9).
clause(d9_k1_g_2, 1).
point(d9_k1_g_2, "g").
subject(d9_k1_g_2, rudimentary_vehicle).
action(d9_k1_g_2, ride_side_by_side).
context(d9_k1_g_2, two_or_more_vehicles).
fine_min(d9_k1_g_2, 100000).
fine_max(d9_k1_g_2, 200000).
original_vi_text(d9_k1_g_2, "Xe thô sơ khác đi dàn hàng ngang từ 02 xe trở lên").

rule(d9_k1_h_1).
rule_type(d9_k1_h_1, primary_violation).
article(d9_k1_h_1, 9).
clause(d9_k1_h_1, 1).
point(d9_k1_h_1, "h").
subject(d9_k1_h_1, bicycle).
action(d9_k1_h_1, use_umbrella_while_driving).
fine_min(d9_k1_h_1, 100000).
fine_max(d9_k1_h_1, 200000).
original_vi_text(d9_k1_h_1, "Người điều khiển xe đạp, xe đạp máy sử dụng ô (dù)").

rule(d9_k1_h_2).
rule_type(d9_k1_h_2, primary_violation).
article(d9_k1_h_2, 9).
clause(d9_k1_h_2, 1).
point(d9_k1_h_2, "h").
subject(d9_k1_h_2, bicycle).
action(d9_k1_h_2, use_phone_or_electronic_device_while_driving).
fine_min(d9_k1_h_2, 100000).
fine_max(d9_k1_h_2, 200000).
original_vi_text(d9_k1_h_2, "Dùng tay cầm và sử dụng điện thoại hoặc các thiết bị điện tử khác").

rule(d9_k1_h_3).
rule_type(d9_k1_h_3, primary_violation).
article(d9_k1_h_3, 9).
clause(d9_k1_h_3, 1).
point(d9_k1_h_3, "h").
subject(d9_k1_h_3, bicycle).
action(d9_k1_h_3, carry_passenger_using_umbrella).
fine_min(d9_k1_h_3, 100000).
fine_max(d9_k1_h_3, 200000).
original_vi_text(d9_k1_h_3, "Chở người ngồi trên xe đạp, xe đạp máy sử dụng ô (dù)").

rule(d9_k1_i).
rule_type(d9_k1_i, primary_violation).
article(d9_k1_i, 9).
clause(d9_k1_i, 1).
point(d9_k1_i, "i").
subject(d9_k1_i, rudimentary_vehicle).
action(d9_k1_i, drive_without_light_or_signal_at_night).
context(d9_k1_i, from_18pm_to_06am).
fine_min(d9_k1_i, 100000).
fine_max(d9_k1_i, 200000).
original_vi_text(d9_k1_i, "Điều khiển xe thô sơ trong thời gian từ 18 giờ ngày hôm trước đến 06 giờ ngày hôm sau không sử dụng đèn hoặc không có báo hiệu ở phía trước và phía sau xe").

rule(d9_k1_k_1).
rule_type(d9_k1_k_1, primary_violation).
article(d9_k1_k_1, 9).
clause(d9_k1_k_1, 1).
point(d9_k1_k_1, "k").
subject(d9_k1_k_1, non_motorized_vehicle).
action(d9_k1_k_1, leave_vehicle_illegally).
context(d9_k1_k_1, on_roadway_or_sidewalk).
fine_min(d9_k1_k_1, 100000).
fine_max(d9_k1_k_1, 200000).
original_vi_text(d9_k1_k_1, "Để xe ở lòng đường, vỉa hè trái phép").

rule(d9_k1_k_2).
rule_type(d9_k1_k_2, primary_violation).
article(d9_k1_k_2, 9).
clause(d9_k1_k_2, 1).
point(d9_k1_k_2, "k").
subject(d9_k1_k_2, non_motorized_vehicle).
action(d9_k1_k_2, park_on_roadway_obstructing_traffic).
context(d9_k1_k_2, on_roadway).
fine_min(d9_k1_k_2, 100000).
fine_max(d9_k1_k_2, 200000).
original_vi_text(d9_k1_k_2, "Đỗ xe ở lòng đường gây cản trở giao thông").

rule(d9_k1_k_3).
rule_type(d9_k1_k_3, primary_violation).
article(d9_k1_k_3, 9).
clause(d9_k1_k_3, 1).
point(d9_k1_k_3, "k").
subject(d9_k1_k_3, non_motorized_vehicle).
action(d9_k1_k_3, park_on_bridge_obstructing_traffic).
context(d9_k1_k_3, on_bridge).
fine_min(d9_k1_k_3, 100000).
fine_max(d9_k1_k_3, 200000).
original_vi_text(d9_k1_k_3, "Đỗ xe trên cầu gây cản trở giao thông").

rule(d9_k1_l).
rule_type(d9_k1_l, primary_violation).
article(d9_k1_l, 9).
clause(d9_k1_l, 1).
point(d9_k1_l, "l").
subject(d9_k1_l, non_motorized_vehicle).
action(d9_k1_l, violate_stopping_or_parking_rules_at_railway_crossing).
context(d9_k1_l, at_level_railway_crossing).
fine_min(d9_k1_l, 100000).
fine_max(d9_k1_l, 200000).
original_vi_text(d9_k1_l, "Không tuân thủ các quy định về dừng xe, đỗ xe tại nơi đường bộ giao nhau cùng mức với đường sắt").

rule(d9_k1_m).
rule_type(d9_k1_m, primary_violation).
article(d9_k1_m, 9).
clause(d9_k1_m, 1).
point(d9_k1_m, "m").
subject(d9_k1_m, rudimentary_vehicle).
action(d9_k1_m, use_pushcart_as_mobile_vendor_obstructing_traffic).
context(d9_k1_m, on_road).
fine_min(d9_k1_m, 100000).
fine_max(d9_k1_m, 200000).
original_vi_text(d9_k1_m, "Dùng xe đẩy làm quầy hàng lưu động trên đường gây cản trở giao thông").

rule(d9_k1_n).
rule_type(d9_k1_n, primary_violation).
article(d9_k1_n, 9).
clause(d9_k1_n, 1).
point(d9_k1_n, "n").
subject(d9_k1_n, non_motorized_vehicle).
action(d9_k1_n, fail_to_slow_down_or_yield).
context(d9_k1_n, from_non_priority_road_to_priority_road).
context(d9_k1_n, from_branch_road_to_main_road).
fine_min(d9_k1_n, 100000).
fine_max(d9_k1_n, 200000).
original_vi_text(d9_k1_n, "Không giảm tốc độ (hoặc dừng lại) và nhường đường khi điều khiển xe đi từ đường không ưu tiên ra đường ưu tiên, từ đường nhánh ra đường chính").

rule(d9_k1_o).
rule_type(d9_k1_o, primary_violation).
article(d9_k1_o, 9).
clause(d9_k1_o, 1).
point(d9_k1_o, "o").
subject(d9_k1_o, non_motorized_vehicle).
action(d9_k1_o, carry_excess_passengers).
exception_ref(d9_k1_o, emergency_transport_patient).
fine_min(d9_k1_o, 100000).
fine_max(d9_k1_o, 200000).
original_vi_text(d9_k1_o, "Xe đạp, xe đạp máy, xe xích lô chở quá số người quy định").

rule(d9_k1_p).
rule_type(d9_k1_p, primary_violation).
article(d9_k1_p, 9).
clause(d9_k1_p, 1).
point(d9_k1_p, "p").
subject(d9_k1_p, non_motorized_vehicle).
action(d9_k1_p, drive_with_low_alcohol_concentration).
context(d9_k1_p, alcohol_not_exceeding_50mg_per_100ml_blood_or_0_25mg_per_liter_breath).
fine_min(d9_k1_p, 100000).
fine_max(d9_k1_p, 200000).
original_vi_text(d9_k1_p, "Điều khiển xe trên đường mà trong máu hoặc hơi thở có nồng độ cồn nhưng chưa vượt quá 50 miligam/100 mililít máu hoặc chưa vượt quá 0,25 miligam/1 lít khí thở").

rule(d9_k2_a_1).
rule_type(d9_k2_a_1, primary_violation).
article(d9_k2_a_1, 9).
clause(d9_k2_a_1, 2).
point(d9_k2_a_1, "a").
subject(d9_k2_a_1, bicycle).
action(d9_k2_a_1, release_both_hands_while_driving).
fine_min(d9_k2_a_1, 150000).
fine_max(d9_k2_a_1, 250000).
original_vi_text(d9_k2_a_1, "Điều khiển xe đạp, xe đạp máy buông cả hai tay").

rule(d9_k2_a_2).
rule_type(d9_k2_a_2, primary_violation).
article(d9_k2_a_2, 9).
clause(d9_k2_a_2, 2).
point(d9_k2_a_2, "a").
subject(d9_k2_a_2, bicycle).
action(d9_k2_a_2, suddenly_turn_in_front_of_moving_motor_vehicle).
fine_min(d9_k2_a_2, 150000).
fine_max(d9_k2_a_2, 250000).
original_vi_text(d9_k2_a_2, "Chuyển hướng đột ngột trước đầu xe cơ giới đang chạy").

rule(d9_k2_a_3).
rule_type(d9_k2_a_3, primary_violation).
article(d9_k2_a_3, 9).
clause(d9_k2_a_3, 2).
point(d9_k2_a_3, "a").
subject(d9_k2_a_3, bicycle).
action(d9_k2_a_3, steer_bicycle_with_feet).
fine_min(d9_k2_a_3, 150000).
fine_max(d9_k2_a_3, 250000).
original_vi_text(d9_k2_a_3, "Dùng chân điều khiển xe đạp, xe đạp máy").

rule(d9_k2_b).
rule_type(d9_k2_b, primary_violation).
article(d9_k2_b, 9).
clause(d9_k2_b, 2).
point(d9_k2_b, "b").
subject(d9_k2_b, non_motorized_vehicle).
action(d9_k2_b, disobey_traffic_controller_or_inspector).
fine_min(d9_k2_b, 150000).
fine_max(d9_k2_b, 250000).
original_vi_text(d9_k2_b, "Không chấp hành hiệu lệnh, chỉ dẫn của người điều khiển giao thông hoặc người kiểm soát giao thông").

rule(d9_k2_c_1).
rule_type(d9_k2_c_1, primary_violation).
article(d9_k2_c_1, 9).
clause(d9_k2_c_1, 2).
point(d9_k2_c_1, "c").
subject(d9_k2_c_1, non_motorized_vehicle).
action(d9_k2_c_1, cling_pull_or_push_other_vehicle_or_object).
fine_min(d9_k2_c_1, 150000).
fine_max(d9_k2_c_1, 250000).
original_vi_text(d9_k2_c_1, "Người đang điều khiển xe hoặc chở người ngồi trên xe bám, kéo, đẩy xe khác, vật khác").

rule(d9_k2_c_2).
rule_type(d9_k2_c_2, primary_violation).
article(d9_k2_c_2, 9).
clause(d9_k2_c_2, 2).
point(d9_k2_c_2, "c").
subject(d9_k2_c_2, non_motorized_vehicle).
action(d9_k2_c_2, carry_bulky_goods).
fine_min(d9_k2_c_2, 150000).
fine_max(d9_k2_c_2, 250000).
original_vi_text(d9_k2_c_2, "Mang vác vật cồng kềnh").

rule(d9_k2_c_3).
rule_type(d9_k2_c_3, primary_violation).
article(d9_k2_c_3, 9).
clause(d9_k2_c_3, 2).
point(d9_k2_c_3, "c").
subject(d9_k2_c_3, non_motorized_vehicle).
action(d9_k2_c_3, tow_other_vehicle_or_object).
fine_min(d9_k2_c_3, 150000).
fine_max(d9_k2_c_3, 250000).
original_vi_text(d9_k2_c_3, "Điều khiển xe kéo theo xe khác, vật khác").

rule(d9_k2_d_1).
rule_type(d9_k2_d_1, primary_violation).
article(d9_k2_d_1, 9).
clause(d9_k2_d_1, 2).
point(d9_k2_d_1, "d").
subject(d9_k2_d_1, non_motorized_vehicle).
action(d9_k2_d_1, fail_to_yield_to_overtaking_vehicle).
fine_min(d9_k2_d_1, 150000).
fine_max(d9_k2_d_1, 250000).
original_vi_text(d9_k2_d_1, "Không nhường đường cho xe xin vượt khi có đủ điều kiện an toàn").

rule(d9_k2_d_2).
rule_type(d9_k2_d_2, primary_violation).
article(d9_k2_d_2, 9).
clause(d9_k2_d_2, 2).
point(d9_k2_d_2, "d").
subject(d9_k2_d_2, non_motorized_vehicle).
action(d9_k2_d_2, obstruct_overtaking_motor_vehicle).
fine_min(d9_k2_d_2, 150000).
fine_max(d9_k2_d_2, 250000).
original_vi_text(d9_k2_d_2, "Gây cản trở đối với xe cơ giới xin vượt").

rule(d9_k2_d_3).
rule_type(d9_k2_d_3, primary_violation).
article(d9_k2_d_3, 9).
clause(d9_k2_d_3, 2).
point(d9_k2_d_3, "d").
subject(d9_k2_d_3, non_motorized_vehicle).
action(d9_k2_d_3, obstruct_priority_vehicle).
fine_min(d9_k2_d_3, 150000).
fine_max(d9_k2_d_3, 250000).
original_vi_text(d9_k2_d_3, "Gây cản trở xe ưu tiên").

rule(d9_k2_dd).
rule_type(d9_k2_dd, primary_violation).
article(d9_k2_dd, 9).
clause(d9_k2_dd, 2).
point(d9_k2_dd, "đ").
subject(d9_k2_dd, non_motorized_vehicle).
action(d9_k2_dd, run_red_light).
fine_min(d9_k2_dd, 150000).
fine_max(d9_k2_dd, 250000).
original_vi_text(d9_k2_dd, "Không chấp hành hiệu lệnh của đèn tín hiệu giao thông").

rule(d9_k3_a_1).
rule_type(d9_k3_a_1, primary_violation).
article(d9_k3_a_1, 9).
clause(d9_k3_a_1, 3).
point(d9_k3_a_1, "a").
subject(d9_k3_a_1, non_motorized_vehicle).
action(d9_k3_a_1, weave_or_swerve).
fine_min(d9_k3_a_1, 300000).
fine_max(d9_k3_a_1, 400000).
original_vi_text(d9_k3_a_1, "Điều khiển xe lạng lách, đánh võng").

rule(d9_k3_a_2).
rule_type(d9_k3_a_2, primary_violation).
article(d9_k3_a_2, 9).
clause(d9_k3_a_2, 3).
point(d9_k3_a_2, "a").
subject(d9_k3_a_2, non_motorized_vehicle).
action(d9_k3_a_2, chase_each_other_on_road).
fine_min(d9_k3_a_2, 300000).
fine_max(d9_k3_a_2, 400000).
original_vi_text(d9_k3_a_2, "Đuổi nhau trên đường").

rule(d9_k3_b_1).
rule_type(d9_k3_b_1, primary_violation).
article(d9_k3_b_1, 9).
clause(d9_k3_b_1, 3).
point(d9_k3_b_1, "b").
subject(d9_k3_b_1, bicycle).
action(d9_k3_b_1, ride_on_one_wheel).
fine_min(d9_k3_b_1, 300000).
fine_max(d9_k3_b_1, 400000).
original_vi_text(d9_k3_b_1, "Đi xe bằng một bánh đối với xe đạp, xe đạp máy").

rule(d9_k3_b_2).
rule_type(d9_k3_b_2, primary_violation).
article(d9_k3_b_2, 9).
clause(d9_k3_b_2, 3).
point(d9_k3_b_2, "b").
subject(d9_k3_b_2, cyclo).
action(d9_k3_b_2, ride_on_two_wheels).
fine_min(d9_k3_b_2, 300000).
fine_max(d9_k3_b_2, 400000).
original_vi_text(d9_k3_b_2, "Đi xe bằng hai bánh đối với xe xích lô").

rule(d9_k3_c_1).
rule_type(d9_k3_c_1, primary_violation).
article(d9_k3_c_1, 9).
clause(d9_k3_c_1, 3).
point(d9_k3_c_1, "c").
subject(d9_k3_c_1, non_motorized_vehicle).
action(d9_k3_c_1, enter_prohibited_area_or_road).
context(d9_k3_c_1, prohibited_for_vehicle_type).
fine_min(d9_k3_c_1, 300000).
fine_max(d9_k3_c_1, 400000).
original_vi_text(d9_k3_c_1, "Đi vào khu vực cấm, đường có biển báo hiệu nội dung cấm đi vào đối với loại phương tiện đang điều khiển").

rule(d9_k3_c_2).
rule_type(d9_k3_c_2, primary_violation).
article(d9_k3_c_2, 9).
clause(d9_k3_c_2, 3).
point(d9_k3_c_2, "c").
subject(d9_k3_c_2, non_motorized_vehicle).
action(d9_k3_c_2, drive_against_traffic).
context(d9_k3_c_2, one_way_road_or_no_entry_road).
fine_min(d9_k3_c_2, 300000).
fine_max(d9_k3_c_2, 400000).
original_vi_text(d9_k3_c_2, "Đi ngược chiều đường của đường một chiều, đường có biển \"Cấm đi ngược chiều\"").

rule(d9_k3_d).
rule_type(d9_k3_d, primary_violation).
article(d9_k3_d, 9).
clause(d9_k3_d, 3).
point(d9_k3_d, "d").
subject(d9_k3_d, non_motorized_vehicle).
action(d9_k3_d, drive_with_medium_alcohol_concentration).
context(d9_k3_d, alcohol_over_50_to_80mg_per_100ml_blood_or_over_0_25_to_0_4mg_per_liter_breath).
fine_min(d9_k3_d, 300000).
fine_max(d9_k3_d, 400000).
original_vi_text(d9_k3_d, "Điều khiển xe trên đường mà trong máu hoặc hơi thở có nồng độ cồn vượt quá 50 miligam đến 80 miligam/100 mililít máu hoặc vượt quá 0,25 miligam đến 0,4 miligam/1 lít khí thở").

rule(d9_k4_a_1).
rule_type(d9_k4_a_1, primary_violation).
article(d9_k4_a_1, 9).
clause(d9_k4_a_1, 4).
point(d9_k4_a_1, "a").
subject(d9_k4_a_1, non_motorized_vehicle).
action(d9_k4_a_1, fail_to_stop_after_accident).
context(d9_k4_a_1, after_traffic_accident).
fine_min(d9_k4_a_1, 400000).
fine_max(d9_k4_a_1, 600000).
original_vi_text(d9_k4_a_1, "Gây tai nạn giao thông không dừng ngay phương tiện").

rule(d9_k4_a_2).
rule_type(d9_k4_a_2, primary_violation).
article(d9_k4_a_2, 9).
clause(d9_k4_a_2, 4).
point(d9_k4_a_2, "a").
subject(d9_k4_a_2, non_motorized_vehicle).
action(d9_k4_a_2, fail_to_preserve_accident_scene).
context(d9_k4_a_2, after_traffic_accident).
fine_min(d9_k4_a_2, 400000).
fine_max(d9_k4_a_2, 600000).
original_vi_text(d9_k4_a_2, "Không giữ nguyên hiện trường").

rule(d9_k4_a_3).
rule_type(d9_k4_a_3, primary_violation).
article(d9_k4_a_3, 9).
clause(d9_k4_a_3, 4).
point(d9_k4_a_3, "a").
subject(d9_k4_a_3, non_motorized_vehicle).
action(d9_k4_a_3, fail_to_assist_victims).
context(d9_k4_a_3, after_traffic_accident).
fine_min(d9_k4_a_3, 400000).
fine_max(d9_k4_a_3, 600000).
original_vi_text(d9_k4_a_3, "Không trợ giúp người bị nạn").

rule(d9_k4_a_4).
rule_type(d9_k4_a_4, primary_violation).
article(d9_k4_a_4, 9).
clause(d9_k4_a_4, 4).
point(d9_k4_a_4, "a").
subject(d9_k4_a_4, non_motorized_vehicle).
action(d9_k4_a_4, leave_accident_scene).
context(d9_k4_a_4, after_traffic_accident).
fine_min(d9_k4_a_4, 400000).
fine_max(d9_k4_a_4, 600000).
original_vi_text(d9_k4_a_4, "Không ở lại hiện trường").

rule(d9_k4_a_5).
rule_type(d9_k4_a_5, primary_violation).
article(d9_k4_a_5, 9).
clause(d9_k4_a_5, 4).
point(d9_k4_a_5, "a").
subject(d9_k4_a_5, non_motorized_vehicle).
action(d9_k4_a_5, fail_to_report_accident_immediately).
context(d9_k4_a_5, after_traffic_accident).
fine_min(d9_k4_a_5, 400000).
fine_max(d9_k4_a_5, 600000).
original_vi_text(d9_k4_a_5, "Không đến trình báo ngay với cơ quan công an, Ủy ban nhân dân nơi gần nhất").

rule(d9_k4_b).
rule_type(d9_k4_b, primary_violation).
article(d9_k4_b, 9).
clause(d9_k4_b, 4).
point(d9_k4_b, "b").
subject(d9_k4_b, non_motorized_vehicle).
action(d9_k4_b, drive_with_high_alcohol_concentration).
context(d9_k4_b, alcohol_over_80mg_per_100ml_blood_or_over_0_4mg_per_liter_breath).
fine_min(d9_k4_b, 400000).
fine_max(d9_k4_b, 600000).
original_vi_text(d9_k4_b, "Điều khiển xe trên đường mà trong máu hoặc hơi thở có nồng độ cồn vượt quá 80 miligam/100 mililít máu hoặc vượt quá 0,4 miligam/1 lít khí thở").

rule(d9_k4_c).
rule_type(d9_k4_c, primary_violation).
article(d9_k4_c, 9).
clause(d9_k4_c, 4).
point(d9_k4_c, "c").
subject(d9_k4_c, non_motorized_vehicle).
action(d9_k4_c, refuse_alcohol_test).
fine_min(d9_k4_c, 400000).
fine_max(d9_k4_c, 600000).
original_vi_text(d9_k4_c, "Không chấp hành yêu cầu kiểm tra về nồng độ cồn của người thi hành công vụ").

rule(d9_k4_d_1).
rule_type(d9_k4_d_1, primary_violation).
article(d9_k4_d_1, 9).
clause(d9_k4_d_1, 4).
point(d9_k4_d_1, "d").
subject(d9_k4_d_1, electric_bicycle).
action(d9_k4_d_1, not_wear_helmet).
context(d9_k4_d_1, on_road_traffic).
fine_min(d9_k4_d_1, 400000).
fine_max(d9_k4_d_1, 600000).
original_vi_text(d9_k4_d_1, "Người điều khiển xe đạp máy không đội \"mũ bảo hiểm cho người đi mô tô, xe máy\" khi tham gia giao thông trên đường bộ").

rule(d9_k4_d_2).
rule_type(d9_k4_d_2, primary_violation).
article(d9_k4_d_2, 9).
clause(d9_k4_d_2, 4).
point(d9_k4_d_2, "d").
subject(d9_k4_d_2, electric_bicycle).
action(d9_k4_d_2, wear_helmet_improperly).
context(d9_k4_d_2, on_road_traffic).
fine_min(d9_k4_d_2, 400000).
fine_max(d9_k4_d_2, 600000).
original_vi_text(d9_k4_d_2, "Đội \"mũ bảo hiểm cho người đi mô tô, xe máy\" không cài quai đúng quy cách khi tham gia giao thông trên đường bộ").

rule(d9_k4_dd_1).
rule_type(d9_k4_dd_1, primary_violation).
article(d9_k4_dd_1, 9).
clause(d9_k4_dd_1, 4).
point(d9_k4_dd_1, "đ").
subject(d9_k4_dd_1, electric_bicycle).
action(d9_k4_dd_1, carry_passenger_without_helmet).
exception_ref(d9_k4_dd_1, emergency_transport_patient).
exception_ref(d9_k4_dd_1, child_under_6).
exception_ref(d9_k4_dd_1, escorting_law_violator).
fine_min(d9_k4_dd_1, 400000).
fine_max(d9_k4_dd_1, 600000).
original_vi_text(d9_k4_dd_1, "Chở người ngồi trên xe đạp máy không đội \"mũ bảo hiểm cho người đi mô tô, xe máy\"").

rule(d9_k4_dd_2).
rule_type(d9_k4_dd_2, primary_violation).
article(d9_k4_dd_2, 9).
clause(d9_k4_dd_2, 4).
point(d9_k4_dd_2, "đ").
subject(d9_k4_dd_2, electric_bicycle).
action(d9_k4_dd_2, carry_passenger_wearing_helmet_improperly).
exception_ref(d9_k4_dd_2, emergency_transport_patient).
exception_ref(d9_k4_dd_2, child_under_6).
exception_ref(d9_k4_dd_2, escorting_law_violator).
fine_min(d9_k4_dd_2, 400000).
fine_max(d9_k4_dd_2, 600000).
original_vi_text(d9_k4_dd_2, "Chở người ngồi trên xe đạp máy đội \"mũ bảo hiểm cho người đi mô tô, xe máy\" không cài quai đúng quy cách").

rule(d9_k5).
rule_type(d9_k5, primary_violation).
article(d9_k5, 9).
clause(d9_k5, 5).
subject(d9_k5, non_motorized_vehicle).
action(d9_k5, enter_expressway).
exception_ref(d9_k5, highway_management_or_maintenance_vehicle).
fine_min(d9_k5, 800000).
fine_max(d9_k5, 1200000).
original_vi_text(d9_k5, "Người điều khiển xe đi vào đường cao tốc").