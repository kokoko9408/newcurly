package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.BoardAttachVO;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criterial;
import org.zerock.mapper.BoardAttachMapper;
import org.zerock.mapper.BoardMapper;
import org.zerock.model.AttachImageVO;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor // 모든 파라미터를 이용하는 생성자를 만들어줌
public class BoardServiceImpl implements BoardService {

	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;

	@Setter(onMethod_ = @Autowired)
	private BoardAttachMapper attachMapper;



	@Override
	public void register(BoardVO board) {

		log.info("register..." + board);
		mapper.insertSelectKey(board);
		// TODO Auto-generated method stub

		if (board.getAttachList() == null || board.getAttachList().size() <= 0) {
			return;
		}

		board.getAttachList().forEach(attach -> {
			attach.setB_seq((long) board.getB_seq());
			attachMapper.imageEnroll(attach);

		});
	}

	@Override
	public BoardVO get(int b_seq) {

		log.info("get...." + b_seq);
		// TODO Auto-generated method stub
		return mapper.read(b_seq);
	}


	
	@Transactional
	@Override
	public boolean modify(BoardVO board) {

		log.info("수정 :" + board);

	
		attachMapper.deleteAll(board.getB_seq());
		
		boolean modifyResult = mapper.update(board) == 1;

		if (modifyResult  && board.getAttachList() != null && board.getAttachList().size() > 0) {

			attachMapper.deleteImageAll(board.getB_seq());

			board.getAttachList().forEach(attach -> {

				attach.setB_seq((long) board.getB_seq());
				attachMapper.imageEnroll(attach);

			});

		}

		return modifyResult;
	}

	@Override
	public boolean remove(int b_seq) {

		log.info("remove...." + b_seq);
		attachMapper.deleteAll(b_seq);
		return mapper.delete(b_seq) == 1;

	}



	@Override
	public List<BoardVO> getList(Criterial cri) {

		log.info("get List With criterial:" + cri);
		// TODO Auto-generated method stub
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criterial cri) {
		// TODO Auto-generated method stub
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<BoardAttachVO> getAttachList(Long b_seq) {

		log.info("getAttachList");
		return attachMapper.findByB_seq(b_seq);
	}

	@Override
	public List<BoardVO> bestlistAll(Criterial cri) {
		// TODO Auto-generated method stub
		log.info(cri);
		return mapper.bestlistAll(cri);
	}

	@Override
	public int readCount(int b_seq) {
		
		return mapper.readCount(b_seq);
	}

}
