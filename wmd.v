// Create Date: 11/07/2024 11:13:59 AM

`timescale 1ns / 1ps

module wmd(age_category,ecgin,tempin,spo2in,sleepin,ecg,temp,spo2,sleep);

input [1:0] age_category;
input [7:0] ecgin,tempin,spo2in,sleepin;
output ecg,temp,spo2,sleep;

reg ecg,temp,spo2,sleep;
reg [1:0]person;
//wire [1:0]infant,child,adult,pregnant;

parameter [1:0]infant=2'b00;
parameter [1:0]child=2'b01;
parameter [1:0]adult=2'b10;
parameter [1:0]pregnant=2'b11;

parameter [7:0] infant_ecg_min=8'd100;
parameter [7:0] child_ecg_min=8'd70;
parameter [7:0] adult_ecg_min=8'd60;
parameter [7:0] pregnant_ecg_min=8'd60;

parameter [7:0] infant_ecg_max=8'd160;
parameter [7:0] child_ecg_max=8'd120;
parameter [7:0] adult_ecg_max=8'd100;
parameter [7:0] pregnant_ecg_max=8'd100;

parameter [7:0] infant_temp_min=8'd97;
parameter [7:0] child_temp_min=8'd97;
parameter [7:0] adult_temp_min=8'd97;
parameter [7:0] pregnant_temp_min=8'd97;

parameter [7:0] infant_temp_max=8'd100;
parameter [7:0] child_temp_max=8'd100;
parameter [7:0] adult_temp_max=8'd100;
parameter [7:0] pregnant_temp_max=8'd100;

parameter [7:0] infant_spo2_min=8'd90;
parameter [7:0] child_spo2_min=8'd90;
parameter [7:0] adult_spo2_min=8'd90;
parameter [7:0] pregnant_spo2_min=8'd90;

parameter [7:0] infant_spo2_max=8'd100;
parameter [7:0] child_spo2_max=8'd100;
parameter [7:0] adult_spo2_max=8'd100;
parameter [7:0] pregnant_spo2_max=8'd100;

parameter [7:0] infant_sleep_min=8'd12;
parameter [7:0] child_sleep_min=8'd10;
parameter [7:0] adult_sleep_min=8'd7;
parameter [7:0] pregnant_sleep_min=8'd8;

parameter [7:0] infant_sleep_max=8'd16;
parameter [7:0] child_sleep_max=8'd14;
parameter [7:0] adult_sleep_max=8'd9;
parameter [7:0] pregnant_sleep_max=8'd10;

always@(age_category)
 begin
			  if(age_category==2'b00)
				 person=infant;
		else if(age_category==2'b01)
				 person=child;
		else if(age_category==2'b10)
				 person=adult;
		else		
				 person=pregnant;
end

always@(*)
	begin
		case(person)
		infant:begin		
				if((ecgin >= infant_ecg_min) && (ecgin <= infant_ecg_max))
					ecg=1'b1;//normal
				else
					ecg=1'b0;
				 if((tempin >= infant_temp_min) && (tempin <= infant_temp_max))
					temp=1'b1;//normal
				else
					temp=1'b0;
				if((spo2in >= infant_spo2_min) && (spo2in <= infant_spo2_max))
					spo2=1'b1;
				else
					spo2=1'b0;
				if((sleepin >= infant_sleep_min) && (sleepin <= infant_sleep_max))
					sleep=1'b1;
				else
					sleep=1'b0;
		end
		child:begin		
				if((ecgin >= child_ecg_min) && (ecgin <= child_ecg_max))
					ecg=1'b1;//normal
				else
					ecg=1'b0;
				 if((tempin >= child_temp_min) && (tempin <= child_temp_max))
					temp=1'b1;//normal
				else
					temp=1'b0;
				if((spo2in >= child_spo2_min) && (spo2in <= child_spo2_max))
					spo2=1'b1;
				else
					spo2=1'b0;
				if((sleepin >= child_sleep_min) && (sleepin <= child_sleep_max))
					sleep=1'b1;
				else
					sleep=1'b0;
		end
		adult:begin		
				if((ecgin >= adult_ecg_min) && (ecgin <= adult_ecg_max))
					ecg=1'b1;//normal
				else
					ecg=1'b0;
				 if((tempin >= adult_temp_min) && (tempin <= adult_temp_max))
					temp=1'b1;//normal
				else
					temp=1'b0;
				if((spo2in >= adult_spo2_min) && (spo2in <= adult_spo2_max))
					spo2=1'b1;
				else
					spo2=1'b0;
				if((sleepin >= adult_sleep_min) && (sleepin <= adult_sleep_max))
					sleep=1'b1;
				else
					sleep=1'b0;
		end
		pregnant:begin		
				if((ecgin >= pregnant_ecg_min) && (ecgin <= pregnant_ecg_max))
					ecg=1'b1;//normal
				else
					ecg=1'b0;
				 if((tempin >= pregnant_temp_min) && (tempin <= pregnant_temp_max))
					temp=1'b1;//normal
				else
					temp=1'b0;
				if((spo2in >= pregnant_spo2_min) && (spo2in <= pregnant_spo2_max))
					spo2=1'b1;
				else
					spo2=1'b0;
				if((sleepin >= pregnant_sleep_min) && (sleepin <= pregnant_sleep_max))
					sleep=1'b1;
				else
					sleep=1'b0;
		end
		endcase
 end
 endmodule

