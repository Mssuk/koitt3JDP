package com.koitt.tim.dto.member;

public class SjoinStringDto {

    class SjoinDto{
        public String joinString(){
            MemberDto mdto = new MemberDto();
            String birth1, birth2, birth3, birth = "" ;

            StringBuilder sb = new StringBuilder();
            sb.append(mdto.getBirth1()).append('-').append(mdto.getBirth2()).append('-').append(mdto.getBirth3());

            return birth;
        }
    }
}
