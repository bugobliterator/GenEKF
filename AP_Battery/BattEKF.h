#ifndef PLANE_H
#define PLANE_H

#include "ekfilter.hpp"

#define sq(X) X * X

class BattEKF : public Kalman::EKFilter<double,1,false,true,false> {
public:
	BattEKF();

protected:
	void makeBaseA();
	void makeBaseW();
	void makeBaseV();
	void makeBaseR();

	void makeH();
	void makeQ();
	void makeProcess();
	void makeMeasure();

	uint32_t dt;
};

typedef BattEKF::Vector Vector;
typedef BattEKF::Matrix Matrix;

#endif
