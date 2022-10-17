package my.sungjuk;

public class SungjukDTO {
	private int num;
	private String name;
	private String cname;
	private int kor;
	private int eng;
	private int mat;
	private int tot;
	private int rank;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public int getKor() {
		return kor;
	}
	public void setKor(int kor) {
		this.kor = kor;
	}
	public int getEng() {
		return eng;
	}
	public void setEng(int eng) {
		this.eng = eng;
	}
	public int getMat() {
		return mat;
	}
	public void setMat(int mat) {
		this.mat = mat;
	}
	public int getTot() {
		return tot;
	}
	public void setTot() {
		this.tot = kor + eng + mat;
	}
	public int getRank() {
		return rank;
	}
	public void plusRank() {
		rank++;
	}
	public void clearRank() {
		rank = 1;
	}
}
