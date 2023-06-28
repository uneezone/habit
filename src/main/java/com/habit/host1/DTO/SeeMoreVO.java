package com.habit.host1.DTO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter @Setter
public class SeeMoreVO {
    private int offset;
    private int appendRow;
    private int click;
    private int totalRecord;
    private int currentEndRowNum;

    public SeeMoreVO() {
        this.appendRow = 4;
        setClick(0);
    }

    public void setClick (int click) {
        this.click = click;
        calcSeeMoreProcessing();
    }

    private void calcSeeMoreProcessing () {
        this.offset = (click * appendRow);
        this.currentEndRowNum = (click + 1) * appendRow;
    }
}
