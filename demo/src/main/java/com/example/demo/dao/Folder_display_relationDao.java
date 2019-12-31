package com.example.demo.dao;

import com.example.demo.bean.Folder_display_relation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Component;

import java.util.List;

@Component(value = "folder_display_relationDao")
public interface Folder_display_relationDao extends JpaRepository<Folder_display_relation,Long> {

    /**
     * folder 页面初始化
     */
    @Query(value =" SELECT f.f_key_random,f.f_title,l.lang_title,DATE_FORMAT(f.f_createdate, '%Y-%m-%d %H:%i') AS 'createdate',l.lang_id" +
            "  FROM folder f,faqs_language l" +
            " WHERE l.lang_id = f.f_lang_id " +
            " AND if(:langId > 0,f.f_lang_id = :langId,1=1)" +
            " AND f.f_key_random IN (" +
            "  SELECT d.fdr_f_id" +
            "  FROM folder_display_relation d" +
            "  WHERE 1=1" +
            "  AND d.fdr_level = :level" +
            "  AND if(:parenId > 0,d.fdr_parenid = :parenId,1=1)" +
            ")" +
            " ORDER BY f.f_createdate DESC,l.lang_id"
            ,nativeQuery = true)
    List<Object[]> getFolderPage(@Param("level") long level,@Param("parenId") long parenId,@Param("langId") long langId);



    /**
     * folder 页面初始化路径
     */
    @Query(value =" SELECT r.fdr_parenid FROM folder_display_relation r WHERE r.fdr_f_id = :parenId",nativeQuery = true)
    long getFolderTableofContents(@Param("parenId") long parenId);


    @Query(value = "SELECT MAX(fdr_level) FROM  folder_display_relation",nativeQuery = true)
    long getMaxLevel();

    /**
     * 搜索
     */
    @Query(value =" SELECT a.f_id,a.f_title,a.f_key_random,a.f_lang_id" +
            " FROM (" +
            "   SELECT r.ftr_f_id AS 'f_id',f.f_title AS 'f_title',f.f_key_random,f.f_lang_id" +
            "   FROM folder_tags_relation r,folder_tags t,folder f" +
            "   WHERE r.ftr_ft_id = t.ft_id AND f.f_id = r.ftr_f_id " +
            "   AND t.ft_tags in (:searchs)" +
            "   GROUP BY r.ftr_f_id" +
            "   ORDER BY COUNT(*) DESC" +
            " ) a,(" +
            "   SELECT k.f_id AS 'f_id'" +
            "   FROM folder_display_relation d,folder k" +
            "   WHERE d.fdr_f_id = k.f_key_random" +
            "   AND d.fdr_level = :level" +
            " ) b" +
            " WHERE a.f_id = b.f_id",nativeQuery = true)
    List<Object[]> getFolderSelect(@Param("level") long level,@Param("searchs")List<String> searchs);


    /**
     * 搜索无结果-显示首层文件夹
     */
    @Query(value =" SELECT k.f_id AS 'f_id',k.f_title AS 'f_title',k.f_key_random,k.f_lang_id" +
            " FROM folder_display_relation d,folder k" +
            " WHERE d.fdr_f_id = k.f_key_random" +
            " AND d.fdr_level = 1" +
            " AND if(:langId > 0,k.f_lang_id = :langId,1=1)",nativeQuery = true)
    List<Object[]> getFolderSelectByLevel1(@Param("langId") long langId);



    /**
     * 搜索-显示文件夹
     */
    @Query(value =" SELECT k.f_id,k.f_title,k.f_key_random,k.f_lang_id" +
            " FROM folder_display_relation d,folder k" +
            " WHERE d.fdr_f_id = k.f_key_random" +
            " AND k.f_lang_id = :langId" +
            " AND d.fdr_parenid = :key",nativeQuery = true)
    List<Object[]> getSearchFolder(@Param("langId") long langId,@Param("key") long key);



}
