package com.shepe.commons;

public class Paging {
	int recordsPerPage;       // 페이지당 레코드 수
    int currentPageNo;        // 페이지 번호
    int startPageNo;          // 시작 페이지 (페이징 너비 기준)
    int endPageNo;            // 끝 페이지 (페이징 너비 기준)
    int prevPageNo;           // 이전 페이지 번호
    int nextPageNo;           // 다음 페이지 번호
    int firstPageNo;          // 첫번째 페이지 번호
    int finalPageNo;          // 마지막 페이지 번호
    int sizeOfPage;           // 보여지는 페이지 갯수 (1,2,3,4,5 갯수)
    int currentRange;		  // 페이지 범위 단위 번호
    int totalRecord;		  // 전체 레코드 수
    
    public Paging(int currentPageNo, int sizeOfPage, int recordsPerPage) {
        this.currentPageNo = currentPageNo;
        this.sizeOfPage = sizeOfPage;
        this.recordsPerPage = recordsPerPage;
    }

    public void makePaging() {
        if (totalRecord == 0)        // 전체 레코드 수가 없는 경우
            return;
        
        if (currentPageNo == 0)
            setCurrentPageNo(1);        // 기본 값 설정
        
        if (recordsPerPage == 0)
            setRecordsPerPage(10);        // 기본 값 설정
        
        int finalPage = (int)Math.ceil((double)totalRecord / recordsPerPage);  // 마지막 페이지
        
        if (currentPageNo > finalPage)
            setCurrentPageNo(finalPage);		// 기본 값 설정
        
        if (currentPageNo < 0 || currentPageNo > finalPage)		// 현재 페이지 유효성 체크
            currentPageNo = 1;            						// 시작 페이지 (전체)
        
    	int totalRanges = (int) Math.ceil((double) finalPage / sizeOfPage) + 1; 
    	
        setCurrentRange((int) Math.ceil((double) currentPageNo / sizeOfPage));
        int startPage = (currentRange - 1) * sizeOfPage + 1;
        int endPage = startPage + sizeOfPage - 1;        
        
        if(endPage > finalPage)
        	endPage = finalPage;
        
        setFirstPageNo(1);                    // 첫번째 페이지 번호
        
        if (currentRange == 1)
            setPrevPageNo(1);                // 이전 페이지 번호
        else                               
            setPrevPageNo(((currentRange - 1) < 2 ? 1 : ((currentRange - 1) - 1) * sizeOfPage + 1));	// 이전 페이지 번호
 
        setStartPageNo(startPage);            // 시작페이지
        setEndPageNo(endPage);                // 끝 페이지
        
        if (currentRange == totalRanges)
            setNextPageNo(startPage);        // 다음 페이지 번호
        else
            setNextPageNo(currentRange * sizeOfPage + 1);
        
        setFinalPageNo(finalPage);            // 마지막 페이지 번호
    }

    public int getRecordsPerPage() {
        return recordsPerPage;
    }
 
    public void setRecordsPerPage(int recordsPerPage) {
        this.recordsPerPage = recordsPerPage;
    }
 
    public int getFirstPageNo() {
        return firstPageNo;
    }
 
    public void setFirstPageNo(int firstPageNo) {
        this.firstPageNo = firstPageNo;
    }
 
    public int getPrevPageNo() {
        return prevPageNo;
    }
 
    public void setPrevPageNo(int prevPageNo) {
        this.prevPageNo = prevPageNo;
    }
 
    public int getStartPageNo() {
        return startPageNo;
    }
 
    public void setStartPageNo(int startPageNo) {
        this.startPageNo = startPageNo;
    }
 
    public int getCurrentPageNo() {
        return currentPageNo;
    }
 
    public void setCurrentPageNo(int currentPageNo) {
        this.currentPageNo = currentPageNo;
    }
 
    public int getEndPageNo() {
        return endPageNo;
    }
 
    public void setEndPageNo(int endPageNo) {
        this.endPageNo = endPageNo;
    }
 
    public int getNextPageNo() {
        return nextPageNo;
    }
 
    public void setNextPageNo(int nextPageNo) {
        this.nextPageNo = nextPageNo;
    }
 
    public int getFinalPageNo() {
        return finalPageNo;
    }
 
    public void setFinalPageNo(int finalpageNo) {
        this.finalPageNo = finalpageNo;
    }

	public int getSizeOfPage() {
		return sizeOfPage;
	}

	public void setSizeOfPage(int sizeOfPage) {
		this.sizeOfPage = sizeOfPage;
	}

	public int getCurrentRange() {
		return currentRange;
	}

	public void setCurrentRange(int currentRange) {
		this.currentRange = currentRange;
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	
}
