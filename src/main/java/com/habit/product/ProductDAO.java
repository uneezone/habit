package com.habit.product;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class ProductDAO {

    public ProductDAO() {
        System.out.println("-----Product() 객체 생성됨");
    }

    @Autowired
    SqlSession sqlSession;


    public  List<Map<String, Object>> category() {
        return sqlSession.selectList("product.category");
    }

// 아이템 리스트
    public  List<Map<String, Object>> list(String cate_large) {
        return sqlSession.selectList("product.list", cate_large);
    }

//    리스트와 리뷰 연결 (위/아래)
    public List<Integer> contNoList(String cate_large) {
    return sqlSession.selectList("product.contNoList", cate_large);
}

// 리뷰
    public  Map<String, Object> star(int cont_no) {
        return sqlSession.selectOne("product.star", cont_no);
    }

//  가격
    public  Map<String, Object> price(int cont_no) {
    return sqlSession.selectOne("product.price", cont_no);
}

// 중분류
     public  List<Map<String, Object>> middle(String cate_large) {
        return sqlSession.selectList("product.middle", cate_large);
    }

//    상품상세
    public Map<String, Object> detail(int cont_no) {
         return sqlSession.selectOne("product.detail", cont_no);
    }

// 조회수 증가
    public void updateViewCount(int cont_no) {
        sqlSession.update("product.updateViewCount", cont_no);
    }

    //인기 리스트
    public List<Map<String, Object>> hotList(String cate_large) {
        return sqlSession.selectList("product.hotList", cate_large);
    }

    //요약페이지 인기 상위 4개
    public List<Map<String, Object>> hotTop(String cate_large) {
        return sqlSession.selectList("product.hotTop", cate_large);
    }

    //인기&전체 페이지 수량
    public Integer hotListCount(String cate_large){
        return sqlSession.selectOne("product.hotListCount", cate_large);
    }

    //신규 리스트
    public List<Map<String, Object>> newList(String cate_large) {
        return sqlSession.selectList("product.newList", cate_large);
    }

    //요약페이지 인기 상위 4개
    public List<Map<String, Object>> newtop(String cate_large) {
        return sqlSession.selectList("product.newTop", cate_large);
    }

    //신규 페이지 수량
    public Integer newListCount(String cate_large){
        return sqlSession.selectOne("product.newListCount", cate_large);
    }


    //===리뷰가져오기
    public List<ReviewDTO> getReviewList(int cont_no){
        return sqlSession.selectList("product.getReviewList",cont_no);
    }

    public List<ReviewDTO> getReviewListByStar(int cont_no){
        return sqlSession.selectList("product.getReviewListByStar",cont_no);
    }

    //===리뷰상태 변경
    public int changeReviewStatus(int review_no){
        return sqlSession.update("product.changeReviewStatus",review_no);
    }

    //==검색어 테이블 저장
    public int insertSearch(String search){
        return sqlSession.insert("product.insertSearch",search);
    }

    //==인기검색어 노출
    public List<String> showHotSearch(){
        return sqlSession.selectList("product.showHotSearch");
    }

    //검색페이지
    public List<Integer> getContNoForSearch(String search){
        return sqlSession.selectList("product.getContNoForSearch",search);
    }

    public List<ProductDTO> getContList(List<Integer> conts){
        return sqlSession.selectList("product.getContList",conts);
    }
}
