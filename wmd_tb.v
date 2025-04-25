// Create Date: 11/07/2024 11:19:02 AM

`timescale 1ns / 1ps

module wmd_tb;

  // Inputs
  reg [1:0] age_category;
  reg [7:0] ecgin;
  reg [7:0] tempin;
  reg [7:0] spo2in;
  reg [7:0] sleepin;

  // Outputs
  wire ecg;
  wire temp;
  wire spo2;
  wire sleep;

  // Instantiate the Unit Under Test (UUT)
  wmd uut (
    .age_category(age_category),
    .ecgin(ecgin),
    .tempin(tempin),
    .spo2in(spo2in),
    .sleepin(sleepin),
    .ecg(ecg),
    .temp(temp),
    .spo2(spo2),
    .sleep(sleep)
  );

  // Task to apply input stimulus
  task apply_test(
    input [1:0] age,
    input [7:0] ecg_val,
    input [7:0] temp_val,
    input [7:0] spo2_val,
    input [7:0] sleep_val
  );
    begin
      age_category = age;
      ecgin = ecg_val;
      tempin = temp_val;
      spo2in = spo2_val;
      sleepin = sleep_val;
      #10;
    end
  endtask

  initial begin

    // Test 1: Infant - All Normal
    apply_test(2'b00, 8'd120, 8'd98, 8'd96, 8'd14);

    // Test 2: Infant - All Abnormal
    apply_test(2'b00, 8'd90, 8'd95, 8'd85, 8'd10);

    // Test 3: Child - All Normal
    apply_test(2'b01, 8'd100, 8'd98, 8'd95, 8'd12);

    // Test 4: Child - All Abnormal
    apply_test(2'b01, 8'd60, 8'd93, 8'd88, 8'd5);

    // Test 5: Adult - All Normal
    apply_test(2'b10, 8'd75, 8'd98, 8'd95, 8'd8);

    // Test 6: Adult - All Abnormal
    apply_test(2'b10, 8'd50, 8'd96, 8'd85, 8'd5);

    // Test 7: Pregnant - All Normal
    apply_test(2'b11, 8'd85, 8'd98, 8'd95, 8'd9);

    // Test 8: Pregnant - All Abnormal
    apply_test(2'b11, 8'd55, 8'd95, 8'd85, 8'd4);

    #20 $stop;
  end

endmodule

/*

//THIS WAS THE INITIAL TEST BENCH
module wmd_tb;

	// Inputs
	reg [1:0] age_category;
	reg [7:0] ecgin;
	reg [7:0] tempin;
	reg [7:0] spo2in;
	reg [7:0] sleepin;

	// Outputs
	wire ecg;
	wire temp;
	wire spo2;
	wire sleep;

	// Instantiate the Unit Under Test (UUT)
	wmd uut (
		.age_category(age_category),
		.ecgin(ecgin),
		.tempin(tempin),
		.spo2in(spo2in),
		.sleepin(sleepin),
		.ecg(ecg),
		.temp(temp),
		.spo2(spo2),
		.sleep(sleep)
	);

	initial begin
		// Initialize Inputs
		age_category = 0;
		ecgin = 0;
		tempin = 0;
		spo2in = 0;
		sleepin = 0;
		
		#10
		age_category=2'b00;
		ecgin=120;
		tempin=98;
		spo2in=95;
		sleepin=10;
		
		#10
		age_category=2'b01;
		ecgin=124;
		tempin=98;
		spo2in=84;
		sleepin=13;
		
		#10
		age_category=2'b10;
		ecgin=100;
		tempin=100;
		spo2in=100;
		sleepin=6;
		
		#10
		age_category=2'b11;
		ecgin=111;
		tempin=95;
		spo2in=91;
		sleepin=9;
		end
		
		initial #50 $stop;
      
endmodule*/

