#ifndef CHESSSTRUCT_H
#define CHESSSTRUCT_H

#define BOARD_COL 9
#define BOARD_ROW 10
/*
 * 长程子炮车用位行位列[90][1024][2],
 * [90][512][2]直接映射棋子在此位置能到达的相对于行首，列首的最上最下位置
 *
 * 马和象用折叠位棋盘映射走法棋盘 [90][256]
 *
 * 士帅用[9][4]走法预生成数组
*/
enum chess_type {BLANK=0,RK,RS,RX,RM,RC,RP,RZ,BK,BS,BX,BM,BC,BP,BZ};
class ChessStruct
{
public:
    ChessStruct();
};

#endif // CHESSSTRUCT_H
