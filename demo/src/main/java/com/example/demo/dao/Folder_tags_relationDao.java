package com.example.demo.dao;

import com.example.demo.bean.Folder_tags_relation;
import com.example.demo.bean.Logs;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Component;

@Component(value = "folder_tags_relationDao")
public interface Folder_tags_relationDao extends JpaRepository<Folder_tags_relation,Long> {

    @Query(value = " SELECT r.ftr_ft_id FROM folder_tags_relation r WHERE ftr_f_id = :fid"
            ,nativeQuery = true)
    long [] getTagsAllByFid(@Param("fid") long fid);

    void deleteByFid(long id);


}
